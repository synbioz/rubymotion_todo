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

    @titleLabel = titleLabel if @titleLabel.nil?
    @titleLabel.text = @title

    self.addSubview(@titleLabel)
  end

  def titleLabel
    titleLabel = UILabel.alloc.initWithFrame([[10, 0], [300, 40]])
    titleLabel.font = UIFont.fontWithName("AmericanTypewriter-Bold", size: 18)
    titleLabel.textColor = UIColor.blueColor
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.backgroundColor = UIColor.clearColor
    titleLabel
  end
end
