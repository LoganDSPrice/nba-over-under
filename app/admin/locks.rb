ActiveAdmin.register Lock do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pick_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:pick_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'A custom title' do |f|
    inputs 'Details' do
      input :pick_id
    end
    panel 'Markup' do
      "The following can be used in the content below..."
    end
    para "Press cancel to return to the list without saving."
    actions
  end
  
end
