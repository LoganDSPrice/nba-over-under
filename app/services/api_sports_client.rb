class ApiSportsClient
  include HTTParty
  base_uri "https://v1.basketball.api-sports.io/"
  MAX_RETRIES = 5
  attr_accessor :response, :standings
  
  def get_standings(years_of_season: "2022-2023")
    times_retried = 0

    begin
      query = {
        league: "12",
        season: years_of_season
      }
      self.response = self.class.get(
        "/standings",
        query: query,
        headers: headers,
        timeout: 60
      )

    rescue Net::ReadTimeout => error
      if times_retried < MAX_RETRIES
        times_retried += 1
        puts "Failed to fetch standings, retry #{times_retried}/#{MAX_RETRIES}"
        retry
      else
        puts "Exiting script."
        exit(1)
      end
    end

    response_hash = response.to_hash.with_indifferent_access

    self.standings ||= response_hash[:response].first
  end

  protected

  def headers
    {
      "x-apisports-key": ENV["API_SPORTS_API_KEY"] || Rails.application.credentials[:API_SPORTS_API_KEY],
    }
  end
  
end