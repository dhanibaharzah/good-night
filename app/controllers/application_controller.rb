class ApplicationController < ActionController::Base
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

    render_json(nil, 422, 'Invalid Params') unless result.success?
  end
end
