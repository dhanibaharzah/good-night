module Friendship
  class FriendshipsService
    
    
    def initialize(params)
      @params = params
    end
    
    def call
      case @params[:action_type]
      when 'follow'
        follow
      when 'unfollow'
        unfollow
      end
    end
    
    private
    
    def follow
      Friend.create!(
        user_id: @params[:user_id],
        friend_id: @params[:friend_id]
      )
    end
    
    def unfollow
      Friend.find_by(
        user_id: @params[:user_id],
        friend_id: @params[:friend_id]
      ).destroy!
    end
  end
end