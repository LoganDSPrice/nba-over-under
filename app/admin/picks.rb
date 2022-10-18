ActiveAdmin.register Pick do
  # includes :team, :user
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :over, :season_line_id, :enrollment_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:over, :season_line_id, :enrollment_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do 
    id_column
    column :team do |resource|
      resource.team.name
    end
    column :user do |resource|
      resource.user.name
    end
    column :over do |resource|
      resource.over
    end
  end
  
end
