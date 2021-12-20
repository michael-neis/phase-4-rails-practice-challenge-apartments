class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid


private

def record_not_found(error)
    render json: {error: "#{error.model} not found."}
end

def record_invalid(invalid)
    render json: {errors: invalid.record.errors.full_messages}
end

end
