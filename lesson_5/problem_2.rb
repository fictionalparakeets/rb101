# Practice problem 2
# How would you order this array of hashes based on the year of publication of each book from the earliest to latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by! do |book|
  book[:published].to_i
end

p books

# calling .to_i in the block isn't actually necessary since all 4 of the strings in the example are the same length.
