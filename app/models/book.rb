class Book < ActiveRecord::Base
	include HTTParty
	belongs_to :user
	belongs_to :location

	scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
	scope :search_by_isbn, ->(isbn) {where('ISBN LIKE ?', "#{isbn}%") if isbn.present? }
  scope :filter_by_location, ->(location_id) {where("location_id = #{location_id}") if location_id.present?}
	before_save :set_keywords

	api_key = '0087b8655dd56b660197293019804232'
  base_uri 'https://api.douban.com/v2/book'
  default_params apikey: api_key
  format :json

  def self.search_douban_by_isbn term
		add = "/isbn/#{term}"
    get(add, query: {fields: "title,author,summary,isbn13,image,msg"})
  end

	protected
    def set_keywords
    	word = [title, author, description].join(' ')
    	#isbn = [Book.ISBN]
      self.keywords = word
    end
end
