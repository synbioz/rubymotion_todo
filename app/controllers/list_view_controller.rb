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

  def tableView(tableView, viewForHeaderInSection:section)
    # Ajout d'un en-tête
    headerImageView = UIImageView.alloc.initWithFrame([[0, 0], [320, 60]])
    headerImageView.image = UIImage.imageNamed("bgHeader.png")

    # Ajout d'un titre à l'image d'en-tête
    headerTitle = UILabel.alloc.initWithFrame([[0, 0], [320, 50]])
    headerTitle.text = "RubyMotion Todo"
    headerTitle.color = UIColor.colorWithRed(0.702, green: 0.702, blue: 0.702, alpha: 1.000)
    headerTitle.backgroundColor = UIColor.clearColor
    headerTitle.textAlignment = UITextAlignmentCenter
    headerTitle.font = UIFont.fontWithName("AvenirNext-Bold", size: 25)

    headerImageView.addSubview(headerTitle)
    headerImageView.addSubview(deleteButton)
    headerImageView.addSubview(backButton)
    headerImageView.setUserInteractionEnabled(true)

    headerImageView
  end

  def tableView(tableView, heightForHeaderInSection:section)
    60
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
end
