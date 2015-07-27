require 'core/clover_task'

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
        render js: "$('#login-lead-errors').html('The group name or password you entered is incorrect.<br>Please check both for typos and try again.')"
      end
    else
      render js: "$('#login-lead-errors').html('No group by that name.<br>Please check for typos and try again.')"
    end
  end

  def auto_assign_parts
    set_lead_and_group
    index = 0
    parts = @group.parts.where(assigned: params[:original_state])
    parts.each do |part|
      until parts.where(index: index).empty?
        index += 1
      end
      part.update!(index: index, assigned: 'index')
      index += 1
    end
    render 'control'
  end

  def allow_self_assign
    set_lead_and_group
    @group.unassigned_parts.each do |part|
      part.update!(index: nil, assigned: 'choosing')
    end
    render 'control'
  end

  def dismiss_parts
    set_lead_and_group
    @group.parts.where(assigned: params[:assigned]).destroy_all
    render 'control'
  end

  def dismiss_part
    set_lead_and_group
    @group.parts.find_by(index: params[:index]).destroy
    render 'control'
  end

  def poll
    set_lead_and_group
    render 'control'
  end

  private

  def set_lead_and_group
    @lead = Lead.find_by(id: session[:lead])
    @group = @lead.group
  end
end
