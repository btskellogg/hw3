class PostsController < ApplicationController

    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
      if params[:place_id].present?
        @place = Place.find(params[:place_id])
        @post.place_id = @place.id
      end
    end
  
    def create
      @post = Post.new
      if params["post"].present?
        @post.title = params["post"]["title"]
        @post.description = params["post"]["description"]
        @post.posted_on = params["post"]["posted_on"]
        @post.place_id = params["post"]["place_id"]
      end
      if @post.save
        redirect_to "/places/#{@post["place_id"]}"
      else
        redirect_to "/places/#{@post["place_id"]}"
      end

    end

end
