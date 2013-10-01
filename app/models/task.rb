class Task
  @@list = []

  attr_accessor :priority, :name
  attr_reader :done, :created_at

  def initialize
    @done = false
    @created_at = Time.now

    @@list << self
  end

  def self.list
    @@list
  end

  def delete_at(index)
    @@list.delete_at(index)
  end

  def toggle_status!
    @done = !@done
  end
end
