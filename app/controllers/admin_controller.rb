class AdminController < ApplicationController
  before_action :authorise_admin
​
  def burn_all_bridges
    [User].each do |table|
      table.destroy_all
    end
  end
​
  private
  def authorise_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin
  end
end