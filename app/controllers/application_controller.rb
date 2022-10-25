class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    when Customer
      my_page_path
    end
  end
end