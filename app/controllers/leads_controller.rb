class LeadsController < ApplicationController
  skip_before_action :authorize, only: [:create, :login]
  respond_to :js

  def create
    @group = Group.new(groupname: params[:groupname])
    if @group.valid?
      lead = Lead.new(group: @group, password: params[:password])
      if lead.save
        @group.save
        session[:lead] = lead.id
        render 'control'
      else
        html = lead.errors.full_messages.join '<br>'
        render js: "$('#create-lead-errors').html('#{html}')"
      end
    else
      html = @group.errors.full_messages.join '<br>'
      render js: "$('#create-lead-errors').html('#{html}')"
    end
  end

  def login
    @group = Group.find_by(groupname: params[:groupname])
    if @group
      lead = @group.lead
      if lead.authenticate(params[:password])
        session[:lead] = lead.id
        render 'control'
      else
        puts lead.password
        puts params[:password]
        render js: "$('#login-lead-errors').html('The group name or password you entered is incorrect.<br>Please check both for typos and try again.')"
      end
    else
      render js: "$('#login-lead-errors').html('No group by that name.<br>Please check for typos and try again.')"
    end
  end

  def auto_assign_parts
    lead = Lead.find_by(id: session[:lead])
    @group = lead.group
    @group.auto_assign_parts
    render 'control'
  end

  def self_assign_parts
    render 'start_picking_characters'
  end

  def dismiss_unassigned_parts
    render js: "alert('This feature has not been implemented yet');"
  end
end
