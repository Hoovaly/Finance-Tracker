class FriendsController < ApplicationController
  
  def search
    if params[:friend].present?
      @friend=Friend.new_lookup(params[:friend])
        if @friend
          respond_to do |format|
            format.js { render partial: 'users/friend_results' }
          end
        else
          respond_to do |format|
            flash.now[:alert] = "Please enter a valid symbol to search"
            format.js { render partial: 'users/friend_results' }
          end
        end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/friend_results' }
      end
    end
  end

end
