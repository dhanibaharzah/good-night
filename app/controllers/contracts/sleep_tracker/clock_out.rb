class Contracts::SleepTracker::ClockOut < Dry::Validation::Contract
  params do
    required(:user_id).filled(:integer)
    required(:clock_out).filled(:string)
  end
end
