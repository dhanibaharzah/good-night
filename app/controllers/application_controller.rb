require_dependency '../_concerns/tripla_api_error'

class ApplicationController < ActionController::Base
  rescue_from TriplaApiError::BaseError, with: :handle_tripla_api_error
  
  def render_json(params = nil, status = 200, msg = 'Success')
    response = {
      message: msg,
      status: status
    }
    response[:data] = params if params.present? || params.is_a?(FalseClass)
    response[:data] = [] if params == []
    render json: response, status: status
  end
  
  def validate_params!(schema)
    result = schema.call(params.to_unsafe_hash)

    raise TriplaApiError::InvalidParamsError unless result.success?
  end
  
  def handle_tripla_api_error(error)
    render_json(error.data, error.http_status_code, error.message)
  end
end
