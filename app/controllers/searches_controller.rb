class SearchesController < ApplicationController
  before_action :set_search, only: [:show]

  # GET /searches
  def index
    @searches = Search.where(user_id: current_user.id)
  end

  # GET /searches/1
  def show
    render
  end

  # POST /searches
  def create
    @search = Search.new(user_id: params["user_id"])
    @search.get

   respond_to do |format|
     if @search.save
       format.html { redirect_to @search, notice: 'Search was successfully created.' }
       format.json { render :show, status: :created, location: @search }
     else
       format.html { render :new }
       format.json { render json: @search.errors, status: :unprocessable_entity }
     end
   end
  end


  private

    def set_search
      @search = Search.find(params[:id])
    end

end
