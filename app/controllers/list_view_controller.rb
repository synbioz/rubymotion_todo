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

  def goBack
    @taskViewController = TaskViewController.alloc.init
    @taskViewController.view.frame = self.view.frame
    UIView.transitionFromView(self.view,
                              toView: @taskViewController.view,
                              duration: 0.5,
                              options: UIViewAnimationOptionTransitionCurlDown,
                              completion: nil)
  end

  private

  def loadTodos
    @tasks = Task.list
    self.tableView.reloadData
  end

  def deleteButton
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.setTitle("X", forState:UIControlStateNormal)
    button.frame = [[0, 0], [50, 50]]
    button.addTarget(self,
      action:"deleteSelectedCell",
      forControlEvents:UIControlEventTouchUpInside)

    button
  end

  def backButton
    button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    button.frame = [[270, 0], [50, 50]]

    button.setTitle("<-", forState: UIControlStateNormal)

    button.addTarget(self,
                    action: "goBack",
                    forControlEvents: UIControlEventTouchUpInside)

    button
  end

  def prefersStatusBarHidden
    true
  end
end
