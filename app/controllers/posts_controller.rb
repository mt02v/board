class PostsController < ApplicationController
  before_action :set_post, only:[:edit, :update, :destroy]

  #投稿された内容をすべて取得する
  def index
  #データベースから投稿を全て取得する
     @posts = Post.all
  end

  #新しい投稿のコントローラ設定
  def new
    #データベースから投稿を全て取得する
    @post = Post.new
  end

 def create
   @post = Post.new(post_params)

   if @post.save
     redirect_to posts_path
   else
     render :new
   end
 end

 def edit
    # @post = Post.find(params:[:id]])
 end

 def update
    # @post = Post.find(params:[:id])
   if @post.update(post_params)
     redirect_to posts_path
   else
      render :edit
   end
 end

 def destroy
   # @post = Post.find(params:[:id])
   @post.destroy
   redirect_to posts_path
 end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
