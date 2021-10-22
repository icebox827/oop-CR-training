class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

new_book = Book.new("The programmer", "Julius")
p new_book 
