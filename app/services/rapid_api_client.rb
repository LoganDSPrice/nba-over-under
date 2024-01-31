class RapidApiClient
  include HTTParty
  base_uri "https://api-nba-v1.p.rapidapi.com"
  MAX_RETRIES = 5

  def call(endpoint, query)
    times_retried = 0

    begin
      self.class.get(
        endpoint,
        query: query,
        headers: headers,
        timeout: 60
      )
    rescue Net::ReadTimeout => error
      if times_retried < MAX_RETRIES
        times_retried += 1
        puts "Failed to fetch #{endpoint}, retry #{times_retried}/#{MAX_RETRIES}"
        retry
      else
        puts "Exiting script."
        exit(1)
      end
    end
  end

  def get_teams
    query = {}
    response = call("/teams", query)["response"]
    response.select {|team| team.dig("nbaFranchise") && !team.dig("allStar")}
  end

  def get_standings(season: "2023")
    endpoint = "/standings"
    query = {
      league: "standard",
      season: season
    }
    call(endpoint, query)["response"]
  end

  protected

  def headers
    {
      "X-RapidAPI-Host": "api-nba-v1.p.rapidapi.com",
      "X-RapidAPI-Key": ENV['RAPID_API_API_KEY'] || Rails.application.credentials[:RAPID_API_API_KEY]
    }
  end
  
end