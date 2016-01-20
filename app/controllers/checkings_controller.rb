class CheckingsController < ApplicationController
  before_action :set_checking, only: [:show, :edit, :update, :destroy]
  include SessionsHelper

  # GET /checkings
  # GET /checkings.json
  def index
    @checkings = Checking.all
  end

  # GET /checkings/1
  # GET /checkings/1.json
  def show
  end

  # GET /checkings/new
  def new
	 @user = User.find_by(YiBoID: params[:YiBoID])
	 @books = @user.books
    @checking = Checking.new(user: @user)
  end
  
  def checking
    if @checking.status == "in"
	   @checking.books.first.update!(user_id: nil)
		flash[:notice] ="#{@checking.user.name}已经将#{@checking.books.first.title}归还"
	 elsif @checking.status == "out"
	 	@checking.books.each do |book|
		  book.update(user_id: @checking.user.id)
		end
	   flash[:notice] = "图书已经被#{@checking.user.name}借出"	  
	 end
	 redirect_to new_checking_path
  end

  # GET /checkings/1/edit
  def edit
  end

  # POST /checkings
  # POST /checkings.json
  def create
    @checking = Checking.new(checking_params)

    respond_to do |format|
      if @checking.save
        format.html { redirect_to @checking, notice: 'Checking was successfully created.' }
        format.json { render :show, status: :created, location: @checking }
      else
        format.html { render :new }
        format.json { render json: @checking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /checkings/1
  # PATCH/PUT /checkings/1.json
  def update
    respond_to do |format|
      if @checking.update(checking_params)
        format.html { redirect_to @checking, notice: 'Checking was successfully updated.' }
        format.json { render :show, status: :ok, location: @checking }
      else
        format.html { render :edit }
        format.json { render json: @checking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkings/1
  # DELETE /checkings/1.json
  def destroy
    @checking.destroy
    respond_to do |format|
      format.html { redirect_to checkings_url, notice: 'Checking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checking
      @checking = Checking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checking_params
      params[:checking]
    end
end
