class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to root_path, notice: "Request sent for: #{@request.name}"
    else
      # redirect_to root_path, notice: "Error: the request did not save."
      # render_to_string(partial: "/shared/modalrequest", locals: { request: @request })
      @display_modal_request = true
      render "brands/index"
    end
  end

  def request_params
    params.require(:request).permit(:name)
  end
end
