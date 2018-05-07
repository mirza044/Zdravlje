class PostsController < ApplicationController
    
    def index
        @post = Post.all
    end
  
    def show
        @post = Post.find(params[:id])
    end
  
    def new
    @post=Post.new
   end
  
   def edit
    @post = Post.find(params[:id])
   end

def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    respond_to do |f|
        if (@post.save)
            f.html {redirect_to "", notice: "Poruka kreirana"}
        else
            f.html {redirect_to "", notice: "Greska: Poruka nije kreirana"}
        end
    end
end

    def update
        @post = Post.find(params[:id])
       
        if @post.update(post_params)
          redirect_to @post
        else
          render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
       
        redirect_to posts_path
    end

    private
    def post_params #allows certain data to be passed via form.
        params.require(:post).permit(:user_id, :content, :naslov)
    end
end