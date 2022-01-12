require 'optparse'

desc 'import season picks from csv'
task :import_season_picks, [:filename] => :environment do |t, args|
  options = {}
  opts = OptionParser.new
  opts.banner = "Usage: rake import_season_picks [options]"
  opts.on("-c", "--csv ARG", String) { |filename| options[:filename] = filename }
  args = opts.order!(ARGV) {}
  opts.parse!(args)


  CsvSeasonPicksImporter.import_csv(options[:filename])
end