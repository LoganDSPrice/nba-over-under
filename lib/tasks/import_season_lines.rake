require 'optparse'

desc 'import season lines from csv'
task :import_season_lines, [:filename] => :environment do |t, args|
  options = {}
  opts = OptionParser.new
  opts.banner = "Usage: rake import_season_lines [options]"
  opts.on("-c", "--csv ARG", String) { |filename| options[:filename] = filename }
  args = opts.order!(ARGV) {}
  opts.parse!(args)


  CsvSeasonLineImporter.import_csv(options[:filename])
end