class HomepagePostsController < ApplicationController
  before_action :set_homepage_post, only: [:show, :edit, :update, :destroy]

  # GET /homepage_posts
  # GET /homepage_posts.json
  def index
    @homepage_posts = HomepagePost.all
  end

  # GET /homepage_posts/1
  # GET /homepage_posts/1.json
  def show
  end

  # GET /homepage_posts/new
  def new
    @homepage_post = HomepagePost.new
  end

  # GET /homepage_posts/1/edit
  def edit
  end

  # POST /homepage_posts
  # POST /homepage_posts.json
  def create
    @homepage_post = HomepagePost.new(homepage_post_params)

    respond_to do |format|
      if @homepage_post.save
        format.html { redirect_to @homepage_post, notice: 'Homepage post was successfully created.' }
        format.json { render :show, status: :created, location: @homepage_post }
      else
        format.html { render :new }
        format.json { render json: @homepage_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homepage_posts/1
  # PATCH/PUT /homepage_posts/1.json
  def update
    respond_to do |format|
      if @homepage_post.update(homepage_post_params)
        format.html { redirect_to @homepage_post, notice: 'Homepage post was successfully updated.' }
        format.json { render :show, status: :ok, location: @homepage_post }
      else
        format.html { render :edit }
        format.json { render json: @homepage_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homepage_posts/1
  # DELETE /homepage_posts/1.json
  def destroy
    @homepage_post.destroy
    respond_to do |format|
      format.html { redirect_to homepage_posts_url, notice: 'Homepage post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homepage_post
      @homepage_post = HomepagePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homepage_post_params
      params.require(:homepage_post).permit(:post_title, :post_text, :post_img_url)
    end
end
