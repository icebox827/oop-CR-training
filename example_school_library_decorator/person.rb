require './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown')
    @id = Random.rand(1..1000)
    @corrector = Corrector.new
    @age = age
    @name = name
    @rentals = []
  end

  def can_use_services?
    @parent_permission || is_of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
