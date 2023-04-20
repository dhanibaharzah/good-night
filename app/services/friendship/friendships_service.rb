module Friendship
  class FriendshipsService
    def initialize(params)
      @params = params
    end
    
    def call
      raise TriplaApiError::DuplicateRecordError unless check_eligibility?
      perform_actions 
    end
    
    private
    
    def perform_actions
      case @params[:action_type]
      when 'follow'
        follow
      when 'unfollow'
        unfollow
      end
    end
    
    def check_eligibility?
      if @params[:action_type] == 'follow'
        Friend.where(user_id: @params[:user_id], friend_id: @params[:friend_id]).empty? 
      else
        return true
      end
    end
      
    def follow
      Friend.create!(
        user_id: @params[:user_id],
        friend_id: @params[:friend_id]
      )
      
    rescue => e
      raise TriplaApiError::InvalidRecordError
    end
    
    def unfollow
      Friend.find_by(
        user_id: @params[:user_id],
        friend_id: @params[:friend_id]
      ).destroy!
      
    rescue => e
      raise TriplaApiError::InvalidRecordError
    end
  end
end
