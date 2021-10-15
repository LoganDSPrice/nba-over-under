ActiveAdmin.register SeasonLine do
  permit_params :year

  show do
    attributes_table do
      row(:team) { resource.name }
      row(:season) { resource.year }
      row(:line) 
    end
  end

  filter :year

  form do |f|
    f.inputs do
      attributes_table_for resource do
        row(:team)
        row(:season) { |season_line| season_line.season.year }
      end
      f.input :line
    end
    f.actions
  end

end
