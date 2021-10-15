ActiveAdmin.register Season do
  permit_params :year

  index do
    selectable_column
    id_column
    column :year
    column :created_at
    actions
  end

  show do
    panel "Season Lines" do
      table_for season.season_lines do
        column("Team") { |season_line| season_line.team.name }
        column("Line") { |season_line| season_line.line }
      end
    end
  end

  filter :year

  form do |f|
    f.inputs do
      f.input :year
    end
    f.actions
  end

end
