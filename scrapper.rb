require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  url = "https://www.imdb.com/chart/top"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  #title Column
  urls = []

  html_doc.search('.lister-list .titleColumn a').first(5).each do |element|
    scrap_url = element.attribute('href').value
    movie_url = "http://www.imdb.com#{scrap_url}"

    urls << movie_url
  end
  return urls
end


def scrape_movie(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  summary = html_doc.search('.summary_text').text.strip
  title_and_year = html_doc.search('h1').text.strip
  title = title_and_year.split(":")[0]
  year = title_and_year.split("(")[1].gsub(")", "").to_i
  # director = html_doc.search('.credit_summary_item a').first.text.strip
  director = html_doc.search("h4:contains('Director:') + a").text.strip
  cast = []
  casting = html_doc.search(".primary_photo + td a").first(3).each do |actor|
    cast << actor.text.strip
  end
  {
      cast: cast,
      director: director,
      storyline: summary,
      title: title,
      year: year
    }
end
