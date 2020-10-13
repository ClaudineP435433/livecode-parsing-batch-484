require_relative '../scrapper.rb'

describe '#fetch_movies_url' do
  it "returns the 5 top movies after scrapping" do
    urls = fetch_movies_url
    expected =  [
        "http://www.imdb.com/title/tt0111161/",
        "http://www.imdb.com/title/tt0068646/",
        "http://www.imdb.com/title/tt0071562/",
        "http://www.imdb.com/title/tt0468569/",
        "http://www.imdb.com/title/tt0050083/"
      ]
      expect(urls).to eq(expected)
  end
end

describe "#scrape_movie(url)" do
  it "returns a hash with all data on movie" do
    url = "https://www.imdb.com/title/tt0468569"
    movie = scrape_movie(url)
    expected = {
      cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008
    }
    expect(movie).to eq(expected)
  end
end


















