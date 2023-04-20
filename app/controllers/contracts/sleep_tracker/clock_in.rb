class Contracts::SleepTracker::ClockIn < Dry::Validation::Contract
  params do
    required(:user_id).filled(:integer)
    required(:clock_in).filled(:string)
  end
end
