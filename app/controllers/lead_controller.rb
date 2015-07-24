class LeadController < ApplicationController
  def login
    @lead = logged_in_lead
  end

  def logout
    session[:lead_group_id] = nil
    redirect_to root_path
  end

  private
end
