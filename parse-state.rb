#!/opt/chefdk/embedded/bin/ruby

require 'json'

# "sirius-workshop-station-black-diamonds-02"

def format_hostname(hostname)
  # puts "hostname = #{hostname}"
  return hostname unless hostname.include?('workshop-station')
  hostname = hostname.split('-')
  # puts "hostname = #{hostname}"
  # hostname.delete('sirius')
  # hostname.delete('workshop')
  # hostname.delete('station')
  # hostname.delete('black')
  # puts "hostname[4] = #{hostname[4]}"

  # suit = hostname.pop
  suit = hostname[4]
  # puts "suit = #{suit}"
  # suit_char = case suit
  #             when "hearts"
  #               "♥︎"
  #             when "spades"
  #               "♠︎"
  #             when "diamonds"
  #               "⬥"
  #             when "clubs"
  #               "♣︎"
  #             else
  #               suit
  #             end

  hostname = "#{hostname[4]} - #{hostname[5]}"
  # hostname << suit_char
  # hostname.join(' ')
end

file = ARGV[0];
raise "no file given -- Usage: #{__FILE__} tfstate_file" if file.nil?

raise "File not readable" unless File.readable?(file)

data = JSON.parse(File.read(file))
# puts "data = #{data}"

puts "| Workstation | IP Address |"
puts "| ----------- | ---------- |"

data['modules'].each do |m|
  m['resources'].each do |res_name, res_data|
    # puts "res_name = #{res_name}"
    attrs = res_data['primary']['attributes']
    # puts "attrs = #{attrs}"
    next if attrs['public_ip'].nil?
    puts "| #{format_hostname(attrs['tags.Name'])} | #{attrs['public_ip']} |"
  end
end

