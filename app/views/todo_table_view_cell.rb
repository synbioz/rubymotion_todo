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
    @background_image = UIImageView.alloc.initWithImage(UIImage.imageNamed("bgCell"))
    self.addSubview(@background_image)

    self.addSubview(titleLabel)
    # self.addSubview(dateLabel)
    # self.addSubview(priorityImage) if @priority == "Haut"
  end

  def titleLabel
    titleLabel = UILabel.alloc.initWithFrame([[10, 0], [300, 40]])
    titleLabel.font = UIFont.fontWithName("AmericanTypewriter-Bold", size: 18)
    titleLabel.textColor = UIColor.blueColor
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.backgroundColor = UIColor.clearColor
    titleLabel.text = @title
    titleLabel
  end

  def dateLabel
    dateLabel = UILabel.alloc.initWithFrame([[10, 15], [300, 40]])
    dateLabel.font = UIFont.fontWithName("AmericanTypewriter", size: 12)
    dateLabel.textColor = UIColor.blackColor
    dateLabel.adjustsFontSizeToFitWidth = true
    dateLabel.backgroundColor = UIColor.clearColor
    dateLabel.text = @date.strftime("%d/%m/%Y")
    dateLabel
  end

  def priorityImage
    priorityImage = UIImageView.alloc.initWithImage(UIImage.imageNamed("important"))
    priorityImage.frame = ([[290, 8], [29, 29]])
    priorityImage
  end
end
