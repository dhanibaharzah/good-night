class SleepTrackerController < ApplicationController
  def index
    # return dummy json
    
    render json: {
      "sleep_trackers": [
        {
          "id": 1,
          "date": "2018-01-01",
          "start_time": "2018-01-01T00:00:00.000Z",
          "end_time": "2018-01-01T08:00:00.000Z",
          "duration": 480,
          "quality": 5,
          "notes": "I slept well"
        },
        {
          "id": 2,
          "date": "2018-01-02",
          "start_time": "2018-01-02T00:00:00.000Z",
          "end_time": "2018-01-02T08:00:00.000Z",
          "duration": 480,
          "quality": 5,
          "notes": "I slept well"
        }
      ]
    }
  end
end
