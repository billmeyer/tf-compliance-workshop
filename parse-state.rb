#!/opt/chefdk/embedded/bin/ruby

require 'json'

def suit_to_char(suit)
  case suit
  when 'hearts'
    '❤️'
  when 'spades'
    '♠️'
  when 'diamonds'
    '♦️'
  when 'clubs'
    '♣️'
  end
end

def find_workstation(tfstate, suit, val)
  tfstate['modules'].each do |m|
    m['resources'].each do |res_name, res_data|
      # puts "res_name = #{res_name}"
      attrs = res_data['primary']['attributes']
      # puts "attrs = #{attrs}"
      next if attrs['public_ip'].nil?
      if attrs['tags.Name'].end_with?("#{suit}-#{val}")
        return attrs['public_ip']
      end
    end
  end

  nil
end

file = ARGV[0]
raise "no file given -- Usage: #{__FILE__} tfstate_file" if file.nil?

raise 'File not readable' unless File.readable?(file)

tfstate = JSON.parse(File.read(file))
# puts "tfstate = #{tfstate}"

puts '| Participant | IP Address | Participant | IP Address '
puts '| Participant | IP Address | Participant | IP Address |'
puts '| --- | --- | --- | --- | --- | --- | --- | --- |'

%w(02 03 04 05 06 07 08 09 10 jack queen king ace).each do |val|
  print '|'
  %w(hearts spades diamonds clubs).each do |suit|
    ip_addr = find_workstation(tfstate, suit, val)
    # puts ip_addr
    print " #{val} #{suit_to_char(suit)} | "
    if ip_addr
      print " #{ip_addr} "
    end
    print '|'
  end
  puts
end
