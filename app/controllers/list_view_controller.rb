class ListViewController < UITableViewController
  CELL_REUSE_ID = "TaskCellId"

  def viewWillAppear(animated)
    loadTodos
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @tasks.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    task = @tasks[indexPath.row]
    TodoTableViewCell.cellForTask(task, inTableView:tableView)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    50
  end

  def viewDidLoad
    self.navigationController.navigationBar.setBackgroundImage(UIImage.imageNamed("bgHeader.png"), forBarMetrics:UIBarMetricsDefault)

    self.navigationController.navigationBar.titleTextAttributes = {
      NSForegroundColorAttributeName => UIColor.colorWithRed(0.702, green: 0.702, blue: 0.702, alpha: 1.000),
      NSFontAttributeName => UIFont.fontWithName("AvenirNext-Bold", size: 25)
    }

    self.title = "RubyMotion Todo"
    self.navigationController.tabBarItem.title = "Tâches"

    leftButtonItem = UIBarButtonItem.alloc.initWithCustomView(deleteButton)
    self.navigationItem.setLeftBarButtonItem(leftButtonItem)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    p "row #{indexPath.row} selected"
  end

  def deleteSelectedCell
    selected = self.tableView.indexPathForSelectedRow

    if selected
      @tasks.delete_at(selected.row)
      self.tableView.deleteRowsAtIndexPaths([selected],
        withRowAnimation:UITableViewRowAnimationMiddle)
    end
  end

  private

  def loadTodos
    @tasks = Task.list
    self.tableView.reloadData
  end

  def deleteButton
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle("X", forState:UIControlStateNormal)
    button.frame = [[0, 0], [30, 30]]
    button.addTarget(self,
      action:"deleteSelectedCell",
      forControlEvents:UIControlEventTouchUpInside)

    button
  end

  def prefersStatusBarHidden
    true
  end
end
