class App

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    # *If needed, ask for parameters for the option.
    person_type = gets.chomp
    if person_type != "1" && person_type != "2"
      puts "Invalid option"
      return
    end

    print "Age: "
    # *If needed, ask for parameters for the option.
    age = gets.chomp

    print "Name: "
    # *If needed, ask for parameters for the option.
    name = gets.chomp

    person =
      if person_type == "1"
        print "Has parent permission? [Y/N]: "
        # *If needed, ask for parameters for the option.
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == "y"

        Student.new(age, name, parent_permission)
      elsif person_type == "2"
        print "Specialization: "
        # *If needed, ask for parameters for the option.
        specialization = gets.chomp

        Teacher.new(age, specialization, name)
      end

    @people << person
    puts "Person created successfully"
  end




end