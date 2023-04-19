class Contracts::Friendships::Action < Dry::Validation::Contract
  params do
    required(:user_id).filled(:integer)
    required(:friend_id).filled(:integer)
    required(:action_type).filled(:string)
  end

  rule(:action_type) do
    unless ['follow', 'unfollow'].include?(value)
      key.failure('Invalid Params')
    end
  end
end
