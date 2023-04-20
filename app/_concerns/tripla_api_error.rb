module TriplaApiError
  class BaseError < ::StandardError
    attr_accessor :http_status_code, :data

    def initialize(msg, http_status_code, data = nil)
      @http_status_code = http_status_code
      @data = data
      super(msg)
    end
  end

  # === 400s ===
  class InvalidParamsError < BaseError
    def initialize(msg = 'Params are invalid', data = nil)
      super(msg, 400, data)
    end
  end

  # === 404s ===
  class NotFoundError < BaseError
    def initialize(msg = 'Resource not found', _data = nil)
      super(msg, 404)
    end
  end

  # === 422s ===
  class DuplicateRecordError < BaseError
    def initialize(msg = 'Duplicate record')
      super(msg, 422, data)
    end
  end
  
  class InvalidRecordError < BaseError
    def initialize(msg = 'Invalid record')
      super(msg, 422, data)
    end
  end
end
