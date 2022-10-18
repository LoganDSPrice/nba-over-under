ActiveAdmin.register League do
  config.filters = false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :active, :season_id, :started_at, :draft_order, :active_drafter_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:active, :season_id, :started_at, :draft_order, :active_drafter_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  action_item :enroll_all_users, only: :show do
    link_to "Enroll All Users", enroll_all_users_admin_league_path(resource), method: :post
  end
  
  member_action :enroll_all_users, method: :post do
    User.all.each do |user|
      resource.enrollments.create(user: user)
    end

    redirect_to admin_league_path, notice: "All users enrolled!"
  end

  action_item :build_draft, only: :show do
    link_to "Build Draft", build_draft_admin_league_path(resource), method: :post
  end
  
  member_action :build_draft, method: :post do
    resource.build_draft!
    redirect_to admin_league_path, notice: "Draft Built!"
  end
end
