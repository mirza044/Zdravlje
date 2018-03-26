#The pages controller contains all of the code for any page inside of /pages
class PagesController < ApplicationController
  
  #back-end code for pages/home
  def index
  end

  #back-end code for pages/home
  def home
    @posts = Post.all
    @newPost = Post.new
  end

  #back-end code for pages/home
  def profile

    #grab the username from the URL as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      #redirect to 404 (root for now)
      redirect_to root_path, :notice=> "User not found"
    end

    #grab the username from the url as :id
    

    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new

    @toFollow=User.all.last(5)

  end

  #back-end code for pages/home
  def explore
    @posts = Post.all
    @newPost = Post.new
    @toFollow=User.all.last(5)
  end

  #back-end code for pages/home
  
  def index

      #grab the username from the URL as :id
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      #redirect to 404 (root for now)
      redirect_to root_path, :notice=> "User not found"
    end

    @posts = Post.all
    @newPost = Post.new
    @toFollow=User.all.last(5)
  end

end
