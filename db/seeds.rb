require 'nokogiri'
require 'open-uri'

p 'Populating Wines'

doc = Nokogiri::HTML(open('https://napavintners.com/wineries/all_wineries.asp'))

doc.css('div.container div.row-fluid div.span5').each do |wine|
	begin
		base = wine.children[1].children[3]

		name = base.children[1].children[1].children.text
		address = base.children[2].text.strip
		phone = base.children[4].text.strip

	  if base.children[9].children[0].text == "website"
	  	site = base.children[9].attributes.first[1].value
	  elsif base.children[11].children[0].text == "map"
	    site = base.children[13].attributes.first[1].value
	  else
	    site = base.children[11].attributes.first[1].value
	  end
	rescue StandardError => e
		puts "Could not store #{wine.children[1].children[3].children[1].children[1].children.text}"
		puts "Error: #{e}"
	ensure
		if site
			website = site.sub(/[?](.*)/ , '')
			Winery.create(name: name, address: address, city: '', state: 'CA', phone: phone, website: website)
		else
			Winery.create(name: name, address: address, city: '', state: 'CA', phone: phone)
		end
	end
end

# p "Site: #{wine.children[1].children[3].children[13].attributes.first[1].value

Winery.create(name: "Robert Sinskey Vineyards", address: '6320 Silverado Trail', city: 'Napa', state: 'ca', phone: '707-944-9090', website: 'http://www.robertsinskey.com/')


p 'Wines Populated :)'

p 'Populating Varietals and Photos'

VARIETALS = [
							['Riesling', 'white', 'almost-clear-circle.png'],

							['Savignon Blanc', 'white', 'green-yellow-circle.png'],
							['Verdejo', 'white', 'green-yellow-circle.png'],

							['Abariño', 'white', 'platinum-yellow-circle.png'],
							['Pinot Gris', 'white', 'platinum-yellow-circle.png'],
							['Sémillon', 'white', 'platinum-yellow-circle.png'],

							['Chenin Blanc', 'white', 'pale-yellow-circle.png'],
							['Moscato', 'white', 'pale-yellow-circle.png'],
							['Pinot Blanc', 'white', 'pale-yellow-circle.png'],
							['Gewürztraminer', 'white', 'pale-yellow-circle.png'],

							['Chardonnay', 'white', 'pale-gold-circle.png'],
							['Viognier', 'white', 'pale-gold-circle.png'],

							['Rosé', 'rosé', 'deep-salmon-circle.png'],

							['Pinot Noir', 'red', 'pale-ruby-circle.png'],
							['Gamay', 'red', 'pale-ruby-circle.png'],
							['Grenache', 'red', 'pale-ruby-circle.png'],

							['Sangiovese', 'red', 'deep-violet-circle.png'],
							['Merlot', 'red', 'deep-violet-circle.png'],
							['Cabernet Franc', 'red', 'deep-violet-circle.png'],
							['Zinfandel', 'red', 'deep-violet-circle.png'],
							['Tempranillo', 'red', 'deep-violet-circle.png'],

							['Syrah', 'red', 'deep-purple-circle.png'],
							['Cabernet Sauvignon', 'red', 'deep-purple-circle.png'],
							['Malbec', 'red', 'deep-purple-circle.png'],
							['Petite Syrah', 'red', 'deep-purple-circle.png'],
							['Petite Verdot', 'red', 'deep-purple-circle.png'],

							['Sherry', 'red', 'tawny-circle.png'],
							['Port', 'red', 'tawny-circle.png'],
							['Madeira', 'red', 'tawny-circle.png'],
							['Late Harvest', 'white', 'deep-gold-circle.png']
						]
VARIETALS.each do |var|
	Varietal.create(name: var[0], color: var[1], photo_url: "https://s3.amazonaws.com/blank-wines/#{var[2]}")
end

p 'Varietals done!'