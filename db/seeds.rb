require 'nokogiri'
require 'open-uri'

p 'Populating Varietals and Photos'

VARIETALS = [
							['Riesling', 'white', 'white', 'almost-clear-circle.png'],

							['Sauvignon Blanc', 'white', 'white', 'green-yellow-circle.png'],
							['Verdejo', 'white', 'white', 'green-yellow-circle.png'],

							['Albariño', 'white', 'white', 'platinum-yellow-circle.png'],
							['Pinot Gris', 'white', 'white', 'platinum-yellow-circle.png'],
							['Sémillon', 'white', 'white', 'platinum-yellow-circle.png'],

							['Chenin Blanc', 'white', 'white', 'pale-yellow-circle.png'],
							['Moscato', 'white', 'white', 'pale-yellow-circle.png'],
							['Pinot Blanc', 'white', 'white', 'pale-yellow-circle.png'],
							['Gewürztraminer', 'white', 'white', 'pale-yellow-circle.png'],

							['Chardonnay', 'white', 'white', 'pale-gold-circle.png'],
							['Viognier', 'white', 'white', 'pale-gold-circle.png'],

							['Rosé', 'rosé', 'rosé', 'deep-salmon-circle.png'],

							['Pinot Noir', 'red', 'red', 'pale-ruby-circle.png'],
							['Gamay', 'red', 'red', 'pale-ruby-circle.png'],
							['Grenache', 'red', 'red', 'pale-ruby-circle.png'],

							['Sangiovese', 'red', 'red', 'deep-violet-circle.png'],
							['Merlot', 'red', 'red', 'deep-violet-circle.png'],
							['Cabernet Franc', 'red', 'red', 'deep-violet-circle.png'],
							['Zinfandel', 'red', 'red', 'deep-violet-circle.png'],
							['Tempranillo', 'red', 'red', 'deep-violet-circle.png'],

							['Syrah', 'red', 'red', 'deep-purple-circle.png'],
							['Cabernet Sauvignon', 'red', 'red', 'deep-purple-circle.png'],
							['Malbec', 'red', 'red', 'deep-purple-circle.png'],
							['Petite Syrah', 'red', 'red', 'deep-purple-circle.png'],
							['Petite Verdot', 'red', 'red', 'deep-purple-circle.png'],

							['Sherry', 'dessert', 'red', 'tawny-circle.png'],
							['Port', 'dessert', 'red', 'tawny-circle.png'],
							['Madeira', 'dessert', 'red', 'tawny-circle.png'],
							['Late Harvest', 'dessert', 'white', 'deep-gold-circle.png']
						]

VARIETAL_MAPPING = {'Riesling' => 1,
'Sauvignon Blanc' => 2,
'Verdejo' => 3,
'Albarino' => 4,
'Pinot Gris' => 5,
'Semillon' => 6,
'Chenin Blanc' => 7,
'Moscato' => 8,
'Pinot Blanc' => 9,
'Gewurztraminer' => 10,
'Chardonnay' => 11,
'Viognier' => 12,
'Rose' => 13,
'Pinot Noir' => 14,
'Gamay' => 15,
'Grenache' => 16,
'Sangiovese' => 17,
'Merlot' => 18,
'Cabernet Franc' => 19,
'Zinfandel' => 20,
'Tempranillo' => 21,
'Syrah' => 22,
'Cabernet Sauvignon' => 23,
'Malbec' => 24,
'Petite Syrah' => 25,
'Petite Verdot' => 26,
'Sherry' => 27,
'Port' => 28,
'Madeira' => 29,
'Late Harvest' => 30
}

VARIETALS.each do |var|
	Varietal.create(name: var[0], classification: vaar[1] color: var[2], photo_url: "https://s3.amazonaws.com/blank-wines/#{var[3]}")
end

p 'Varietals done!'

p 'Populating Wines'

base_url = 'https://napavintners.com'
doc = Nokogiri::HTML(open(base_url + '/wineries/all_wineries.asp'))

doc.css('div.container div.row-fluid div.span5').each do |wine|
	begin
		base = wine.children[1].children[3]

		name = base.children[1].children[1].children.text
		address = base.children[2].text.strip
		phone = base.children[4].text.strip

		more_deets = base_url + base.children[1].children[1].attributes.first[1].value
		winery_deets = Nokogiri::HTML(open(more_deets))

		# No need for FB anmd Twitter atm
		# links = winery_deets.css('div.container div.row-fluid div.winery-links')

		club = winery_deets.css('div.container div.row-fluid div.wineclub')
		club.empty? ? club = false : club = true

		varieties = winery_deets.css('div.container div.row-fluid div#varieties div.accordion-inner li')

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
			new_winery = Winery.create(name: name, address: address, city: '', state: 'CA', phone: phone, wine_club: club, website: website)
		else
			new_winery = Winery.create(name: name, address: address, city: '', state: 'CA', phone: phone, wine_club: club)
		end
		varieties.each do |li|
			id = VARIETAL_MAPPING[li.text]
			if id
				new_winery.varietals << Varietal.find(id)
			else
				p "Please add #{li.text} to the list"
			end
		end
	end
end

Winery.create(name: "Robert Sinskey Vineyards", address: '6320 Silverado Trail', city: 'Napa', state: 'CA', phone: '707-944-9090', website: 'http://www.robertsinskey.com/')


p 'Wines Populated :)'