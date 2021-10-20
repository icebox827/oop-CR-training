class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @student = []
  end
end
