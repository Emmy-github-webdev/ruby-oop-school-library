class IO
  def initialize(add_book = {}, add_people = {}, add_rentals = {})
    @book_array = []
    @people_array = []
    @rentals_array = []
    @add_book = add_book
    @add_people = add_people
    @add_rentals = add_rentals
  end
end