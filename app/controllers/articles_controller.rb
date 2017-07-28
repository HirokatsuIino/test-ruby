class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  ## custom -S
#  def make_calendar
#    today = Date.today
#    calendar = {}
#    start_day = today.beginning_of_month
#    start_week = [1, 2, 3, 4, 5, 6, 7]
#    end_week = ["", "", "", "", "", "", ""]
#    end_day = today.end_of_month
#    middle_week = []
#    middle_days = []

#    start_week.count.times do |index|
#      index >= start_day.wday ? start_week[index] = index - start_day.wday + 1 : start_week[index] = ""
#    end
#    (end_day.wday + 1).times do |index|
#      end_week.unshift(end_day.day - index)
#      end_week.delete_at(-1)
#    end
  
#    week_day = 7
#    last_day = start_week[start_week.count - 1]
#    ((end_week[0] - start_week[start_week.count - 1] - 1) / week_day).times do |index|
#      middle_days = []
#      week_day.times do |day|
#        middle_days.push last_day + day + 1
#      end
#      last_day = middle_days[middle_days.count - 1]
#      middle_week.push middle_days
#  end
#  { start_week: start_week, middle_week: middle_week, end_week: end_week }
#  end
  ## custom -E

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :day, :post_date, :is_public, :user_id)
    end
end

