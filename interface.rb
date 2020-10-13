require "yaml"
# array = [ { a: "a" }, { b: "b" }]
# puts array.to_yaml

require_relative 'scraper'

# Scrap url=https://www.imdb.com/chart/top => Liste des 5 premiers films (lien)
urls = fetch_movies_urls
# Voir chaque url pour récupérer le contenu
movies = []
urls.each do |url|
  movie = scrap_movie(url)
  # movie => Hash
  movies << movie
end

p movies


File.open("the_file.yml", "w") do |f|
  f.write(movies.to_yaml)
end
