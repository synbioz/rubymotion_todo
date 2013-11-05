class TodoTableViewCell < UITableViewCell
  TODO_CELL_REUSE_ID = "TodoTableViewCell"

  attr_accessor :title, :date, :priority

  def self.cellForTask(task, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(TODO_CELL_REUSE_ID) || TodoTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:TODO_CELL_REUSE_ID)
    cell.title = task.name
    cell.date = task.created_at
    cell.priority = task.priority
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell
  end

  def layoutSubviews
    if @background_image.nil?
      @background_image = UIImageView.alloc.initWithImage(UIImage.imageNamed("bgCell"))
      self.addSubview(@background_image)
    end
  end
end
