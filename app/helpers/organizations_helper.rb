module OrganizationsHelper

  def current_organization
    if params[:organization_id].present?
      current_organization = params[:organization_id]
    end
  end
end
