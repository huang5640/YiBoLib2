json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :description, :ISBN, :image, :YiBoNum, :keywords
  json.url book_url(book, format: :json)
end
