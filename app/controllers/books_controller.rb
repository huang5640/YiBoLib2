class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :checkIn, :checkOut, :checkingOut]
  before_action :set_user, only: [:registerBook, :checkOut, :checkingOut, :checkIn]
  before_action :set_new_book, only: [:new, :registerBook]
  before_filter :authorize

  ##scope :distinct_book, { where("DISTINCT ISBN") }
  
  include SessionsHelper
  helper :all

  def index 
    all_books = Book.order(:title).paginate(page: params[:page], per_page: 10)
    @locations = Location.all

    if params[:keyword] ##search with keyword
      @books = all_books.search(params[:keyword])
    elsif params[:isbn] ##search with ISBN
      @books = all_books.search_by_isbn(params[:isbn])
    elsif params[:location_id] ##filter by location
      @books = all_books.filter_by_location(params[:location_id])
    else
      @books = all_books
    end
  end

  def new
  end

  def show
    @user = @book.user 
  end

  def edit

  end

  /check in and check out /
  def checking 
  end

  def checking_choose
    @book = Book.find_by(YiBoNum: params[:YiBoNum])
	 if @book
	 	 if @book.user_id
		 	redirect_to check_in_path(@book)
		 else
		   redirect_to check_out_path(@book)
	    end
	 else
	 	flash[:notice] = "书不存在"
	 end
  end

  def checkIn
    @book.update!(user_id: nil)

    flash[:notice] = "#{@user.name}已经将#{@book.title}归还"
    redirect_to checking_book_path
  end

  def checkingOut
    p @user.id
    @book.update(user_id: @user.id)
    flash[:notice] = "图书已经借出"
    redirect_to checking_book_path
  end

  def checkOut
  end

  /new book method/
  def registerBook
    @brandNewBook = Book.create({title: @newBook["title"], author: @newBook["author"], description: @newBook["summary"], ISBN: @newBook["isbn13"], image: @newBook["image"]})
    flash[:notice] = "#{@newBook["title"]}已经入库。"
    redirect_to new_path
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

    def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '用户资料已被更新' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: '成功删除书目' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_user
      if params[:YiBoID] 
        @user = User.find_by(YiBoID: params[:YiBoID])
      else
        @user = Book.find_by(id: params[:id]).user
      end
    end

    def set_new_book
      @newBook = Book.search_douban_by_isbn(params[:isbn]) if params[:isbn]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :ISBN, :user_id)
    end
	 
	 def logged_in_user
	   unless logged_in?
		  flash[:danger] = "请先登入!"
		  redirect_to login_url
		end
	 end
end
