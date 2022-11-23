ActiveAdmin.register SeasonLine do
  # belongs_to :season
  # belongs_to :team

  permit_params :year

  show do
    attributes_table do
      row(:team) { resource.team.name }
      row(:season) { resource.season.year }
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
