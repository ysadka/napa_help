require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://napavintners.com/wineries/all_wineries.asp'))

doc.css('div.container div.row-fluid div.span5').each do |wine|
	begin
		name = wine.children[1].children[3].children[1].children[1].children.text
		address = wine.children[1].children[3].children[2].text.strip
		phone = wine.children[1].children[3].children[4].text.strip
	rescue StandardError => e
		puts "Could not store #{wine.children[1].children[3].children[1].children[1].children.text}"
		puts "Error: #{e}"
	ensure
		Winery.create(name: name, address: address, phone: phone)
	end
end

	# p "Site: #{wine.children[1].children[3].children[13].attributes.first[1].value
