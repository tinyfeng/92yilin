require 'nokogiri'
require 'rest-client'
require 'pry'
def print_title url
  begin
    res = RestClient.get url
    doc = Nokogiri::HTML res.body
    doc.css('.blkContainerSblkCon p').map(&:children).map(&:text).each do |i|
      puts i.gsub("\n", '') + "\n"
    end
    puts '-' * 100
  rescue
    puts "invalid url"
    return
  end
end
puts 'Please input url, and enter "e" to exit.'
while 'e' != url = gets.chomp!
  print_title url
end
