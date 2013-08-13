class Task
  attr_accessor :priority, :name
  attr_reader :done, :created_at

  def initialize
    @done = false
    @created_at = Time.now
  end

  def toggle_status!
    @done = !@done
  end
end
