class Contracts::SleepTracker::Create < Dry::Validation::Contract
  params do
    required(:user_id).filled(:integer)
    required(:start_time).filled(:string)
  end
end
