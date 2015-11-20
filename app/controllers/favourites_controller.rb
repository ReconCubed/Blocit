class FavouritesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @topic = @post.topic
        favourite = current_user.favourites.build(post: @post)
        if favourite.save
            redirect_to [@topic, @post], notice: "Favourited"
        else
            flash[:error] = "There was an error favouriting this post, please try again."
            render :new
        end
    end
    def destroy
        @post = Post.find(params[:post_id])
        @topic = @post.topic
        favourite = Favourite.find(params[:id])
        if favourite.destroy
            redirect_to [@topic, @post], notice: "Unfavourited"
        else
            flash[:error] = "There was an error unfavouriting this post, please try again."
            render :new
        end
        
    end
end
