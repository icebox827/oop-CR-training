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

   # *Create a book.
   def create_book
    print "Title: "
    # *If needed, ask for parameters for the option.
    title = gets.chomp

    print "Author: "
    # *If needed, ask for parameters for the option.
    author = gets.chomp

    @books << Book.new(title, author)
    puts "Book created successfully"
  end

   # *Create a rental.
   def create_rental
    puts "Select a book from the following list by number"
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    # *If needed, ask for parameters for the option.
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    # *If needed, ask for parameters for the option.
    person_index = gets.chomp.to_i

    print "\nDate: "
    # *If needed, ask for parameters for the option.
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts "Rental created successfully"
  end
  
  # *List all rentals for a given person id.
  def list_rentals_for_person_id
    print "ID of person: "
    # *If needed, ask for parameters for the option.
    id = gets.chomp.to_i

    rentals = @rentals.filter {|rental| rental.person.id == id}
    puts "Rentals:"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end


  





end