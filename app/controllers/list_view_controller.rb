class ListViewController < UITableViewController
  CELL_REUSE_ID = "TaskCellId"

  def viewWillAppear(animated)
    loadTodos
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @tasks.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_REUSE_ID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: CELL_REUSE_ID)
    task = @tasks[indexPath.row]
    cell.textLabel.text = task.name
    cell.detailTextLabel.text = [task.created_at.strftime("%d/%M/%Y"), task.priority].join(" - ")
    cell
  end

  private

  def loadTodos
    @tasks = Task.list
    self.tableView.reloadData
  end
end
