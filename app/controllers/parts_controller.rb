class PartsController < ApplicationController
  def create
    sleep 0.4 #wait for client-side animation and slow down silly attacks
    respond_to do |format|
      format.json {render nothing: true, status: :not_found}
    end
  end
end
