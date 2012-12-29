require 'rubygems'
require 'optparse'
require 'active_resource'

#ActiveResource::Base.logger = Logger.new("#{File.dirname(__FILE__)}/events.log")

class ContributionRecord< ActiveResource::Base
  self.site = "http://localhost:3000"

end

 # This hash will hold all of the options
 # parsed from the command-line by
 # OptionParser.
 options = {}

 optparse = OptionParser.new do|opts|
   # Set a banner, displayed at the top
   # of the help screen.
   opts.banner = "Usage: contribution_records_client.rb [options] file1 file2 ..."

   # Define the options, and what they do
   options[:verbose] = false
   opts.on( '-v', '--verbose', 'Output more information' ) do
     options[:verbose] = true
   end

   options[:delete] = false
   opts.on( '-d', '--delete', 'Delete every contribution record' ) do
     options[:delete] = true
   end

   # This displays the help screen, all programs are
   # assumed to have this option.
   opts.on( '-h', '--help', 'Display this screen' ) do
     puts opts
     exit
   end
 end


# Parse the command-line. Remember there are two forms
# of the parse method. The 'parse' method simply parses
# ARGV, while the 'parse!' method parses ARGV and removes
# any options found there, as well as any parameters for
# the options. What's left is the list of files to resize.
optparse.parse!

puts "Being verbose" if options[:verbose]

if options[:delete]
  puts "Deleting all contribution records ... just use rake db:reset w/ an empty seed.rb"
  exit
end

ARGV.each do|f|
   puts "adding contribution records from #{f}..."


  line_number = 0
  File.open(f).each do |record|
    line_number += 1
    if line_number > 1  # skip first line of column headers
      if record.chomp != "\t\t\t"
        fields = record.chomp.split("\t")
        date_fields = fields[7].split("/")
        contrib_date = "#{date_fields[2]}-#{date_fields[0]}-#{date_fields[1]}"
        ContributionRecord.create(:election_year => "2012-09-13",
                                  :cand_last     => fields[0],
                                  :cand_suf      => fields[1],
                                  :cand_first    => fields[2],
                                  :cand_mid      => fields[3],
                                  :party         => fields[4],
                                  :district      => fields[5],
                                  :office        => fields[6],
                                  :contr_date    => contrib_date,
                                  :contr_amount  => fields[8].tr('",', ''),
                                  :contr_type    => fields[9],
                                  :contr_last    => fields[10],
                                  :contr_suf     => fields[11],
                                  :contr_first   => fields[12],
                                  :contr_mid     => fields[13],
                                  :contr_mailing => fields[14],
                                  :contr_city    => fields[15],
                                  :contr_st      => fields[16],
                                  :contr_zip     => fields[17]
                                  )
      end
    end
  end
end


