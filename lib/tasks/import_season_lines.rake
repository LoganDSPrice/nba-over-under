require 'optparse'

desc 'import season lines from csv'
task :import_season_lines, [:filename] => :environment do |t, args|
  options = {}
  opts = OptionParser.new
  opts.banner = "Usage: rake import_season_lines [options]"
  opts.on("-c", "--csv ARG", String) { |filename| options[:filename] = filename }
  args = opts.order!(ARGV) {}
  opts.parse!(args)

  CSV.foreach(options[:filename], headers: true) do |row|
    team = Team.find_by_name(row["Name"])
    season = Season.find_or_create_by(year: row["Season"])
    
    season_line = SeasonLine.find_or_initialize_by(season: season, team: team)

    if season_line.line.nil?
      season_line.update(line: row["Line"])
    end
  end
end