module CsvSeasonLocksImporter
  def self.import_csv(file_path)
    csv = CSV.read(file_path, headers: true)
    names = csv.headers - %w[Team Name Line]
    picks = Pick.all.includes(:enrollment, :user, :team).where(users: { name: names })

    csv.each do |row|
      row_hash = row.to_hash.reject {|header, value| value.nil? || !header.in?(names) }
      picks_to_lock = picks.where(users: { name: row_hash.keys }, team: { name: row['Name'] }).each {|pick| pick.create_lock }
    end
  end
end