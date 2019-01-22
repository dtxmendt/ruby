class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    authorize @posts
    if current_user && current_user.admin?
      render 'users/admin'
  
    if current_user && current_user.guest?
        render 'posts/index'  
  end
  end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    authorize @post

  end

  # GET /posts/new
  def new
    @post = Post.new
    authorize @post
    
  end

  # GET /posts/1/edit
  def edit
     authorize @post
  end

  # POST /postsposts
  # POST /postsposts
  def create
    @post = Post.new(post_params)
    authorize @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    authorize @post
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    def DEL
     @post.avatars.destroy
     authorize @post
      respond_to do |format|
        format.html {redirect_to avatars_url(img), notice: 'Item photo was successfully deleted.'}
        format.json { head :no_content }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id,:title, :body , {avatars: [] })
    end

end
