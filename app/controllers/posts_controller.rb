class PostsController < ApplicationController
　before_action :set_post, only: [:show, :edit, :update, :destroy]
def index
　@posts = Post.all
end
def new
　@post=Post.new
end  
def create
 　@post = Post.new(post_params)
if params[:back]
  render :new
else  
if @post.save

　redirect_to posts_path, notice: "記事を投稿しました！"
else
　render :new
end
end 
end
def show 
end
def edit
end
def update
if @post.update(post_params)
   redirect_to posts_path, notice: "記事をを編集しました！"
else
　 render :edit
end
end
def confirm
　 @post = Post.new(post_params)
　 render :new if @post.invalid?
end
def destroy
  
　 @post.destroy
　 redirect_to posts_path, notice:"記事をを削除しました！"
end
private
def post_params
  params.require(:post).permit(:content)
end
def set_post
  @post = Post.find(params[:id])
end 
end
