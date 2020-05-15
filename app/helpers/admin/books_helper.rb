module Admin::BooksHelper
  def separate_by_comma(array)
    new_array = []
    array.each { |ele| new_array << ele.name }
    new_array.join(", ")
  end
end
