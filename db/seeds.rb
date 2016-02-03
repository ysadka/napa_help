require 'nokogiri'
require 'open-uri'
rails
p 'Populating Wines'

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

p 'Wines Populated :)'

p 'Populating Varietals and Photos'

VARIETALS = [
							['Riesling', 'white', 'almost-clear.png'],

							['Savignon Blanc', 'white', 'green-yellow.png'],
							['Verdejo', 'white', 'green-yellow.png'],

							['Abariño', 'white', 'platinum-yellow.png'],
							['Pinot Gris', 'white', 'platinum-yellow.png'],
							['Sémillon', 'white', 'platinum-yellow.png'],

							['Chenin Blanc', 'white', 'pale-yellow.png'],
							['Moscato', 'white', 'pale-yellow.png'],
							['Pinot Blanc', 'white', 'pale-yellow.png'],
							['Gewürztraminer', 'white', 'pale-yellow.png'],

							['Chardonnay', 'white', 'pale-gold.png'],
							['Viognier', 'white', 'pale-gold.png'],

							['Rosé', 'rosé', 'deep-salmon.png'],

							['Pinot Noir', 'red', 'pale-ruby.png'],
							['Gamay', 'red', 'pale-ruby.png'],
							['Grenache', 'red', 'pale-ruby.png'],

							['Sangiovese', 'red', 'deep-violet.png'],
							['Merlot', 'red', 'deep-violet.png'],
							['Cabernet Franc', 'red', 'deep-violet.png'],
							['Zinfandel', 'red', 'deep-violet.png'],
							['Tempranillo', 'red', 'deep-violet.png'],

							['Syrah', 'red', 'deep-purple.png'],
							['Cabernet Savignon', 'red', 'deep-purple.png'],
							['Malbec', 'red', 'deep-purple.png'],
							['Petite Syrah', 'red', 'deep-purple.png'],
							['Petite Verdot', 'red', 'deep-purple.png'],

							['Sherry', 'red', 'tawny.png'],
							['Port', 'red', 'tawny.png'],
							['Madeira', 'red', 'tawny.png']
						]
VARIETALS.each do |var|
	Varietal.create(name: var[0], color: var[1], photo_url: "https://s3.amazonaws.com/blank-wines/#{var[2]}")
end

p 'Varietals done!'