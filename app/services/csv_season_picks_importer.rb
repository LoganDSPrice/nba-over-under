module CsvSeasonPicksImporter
  def self.import_csv(file_path)
    csv = CSV.read(file_path, headers: true)
    names = csv.headers - %w[Team Name Line]
    picks = Pick.all.includes(:enrollment, :user, :team).where(users: { name: names })

    csv.each do |row|
      team = Team.find_by_name(row['Name'])
      
      picks.where(team: { name: row['Name'] }).each do |pick|
        pick.update(over: row[pick.user.name] == 'OVER')
      end
      
    end
  end
end