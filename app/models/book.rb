class Book < ActiveRecord::Base
	include HTTParty
	belongs_to :user
	belongs_to :location
<<<<<<< HEAD
=======
   has_and_belongs_to_many :checkings
>>>>>>> experiment

	scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
	scope :search_by_isbn, ->(isbn) {where('ISBN LIKE ?', "#{isbn}%") if isbn.present? }
  scope :filter_by_location, ->(location_id) {where("location_id = #{location_id}") if location_id.present?}
	scope :distinct_book, -> { group(:ISBN) }
  before_save :set_keywords, :set_YiBoNum

	api_key = '0087b8655dd56b660197293019804232'
  base_uri 'https://api.douban.com/v2/book'
  default_params apikey: api_key
  format :json

  def self.search_douban_by_isbn term
		add = "/isbn/#{term}"
    rawBook = get(add, query: {fields: "title,author,summary,isbn13,image,msg"})

    if rawBook['msg'].nil?
      book = Book.new(title: rawBook['title'], author: rawBook['author'], 
        description: rawBook['summary'], ISBN: rawBook['isbn13'], 
        image: rawBook['image'])
    else
      book = Book.new(title: "null")
    end
  end

	protected
    def set_keywords
    	word = [title, author, description].join(' ')
      self.keywords = word
    end

	 def set_YiBoNum
<<<<<<< HEAD
	 	while self.YiBoNum == "" || self.YiBoNum.nil?
			num = rand(9999999999)
      if (Book.find_by(YiBoNum: num).nil?)
        self.YiBoNum = num
      end 
=======
	 	while self.YiBoNum == ""  || self.YiBoNum.nil? do
			num = rand(9999999999)
			if Book.find_by(YiBoNum: num).nil?
				self.YiBoNum = num	
			end
>>>>>>> experiment
		end
	 end
end
