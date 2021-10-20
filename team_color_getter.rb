teams_url = 'https://teamcolorcodes.com/nba-team-color-codes/'
teams_doc = Nokogiri::HTML(HTTParty.get(teams_url))
team_links = teams_doc.css('ol:nth-child(8) a')

teams_url_hash = {

}

team_links.each do |team_link|
  teams_url_hash[team_link.children.first.text] = team_link.attributes['href'].value
end

final_hash = {}
# search_queries = {
#   'Cleveland Cavaliers' => {
#     'selector' => '.aligncenter.size-medium.wp-image-5164',
#     'attr' => 'data-ezsrc'
#   },
#   'Golden State Warriors' => {
#     'selector' => "img[alt='golden state warriors logo']",
#     'attr' => 'data-ezsrc'
#   },
#   'Miami Heat' => {
#     'selector' => 'img.aligncenter.size-medium.wp-image-5123',
#     'attr' => 'src'
#   },
#   'New York Knicks' => {
#     'selector' => 'img.aligncenter.size-medium.wp-image-5920',
#     'attr' => 'src'
#   },
#   'Philadelphia 76ers' => {
#     'selector' => 'img.aligncenter.size-medium.wp-image-5933',
#     'attr' => 'src'
#   },
#   'Portland Trail Blazers' => {
#     'selector' => 'p img',
#     'attr' => 'data-ezsrc'
#   }
# }
teams_url_hash.each do |team, url|
  begin
    puts '*' * 60
    puts team
    puts url
    # puts search_queries.class
    puts '*' * 60
    team_doc = Nokogiri::HTML(HTTParty.get(url))
    colorblock = team_doc.css('.colorblock').first
    style = colorblock.attributes['style'].value
    
    logo_src_url = team_doc.css("a[href*='PNG.png']").first.attributes['href'].value
  
    team = "LA Clippers" if team == "Los Angeles Clippers"
    final_hash[team] = {
      'style' => style,
      'logo_src_url' => logo_src_url
    }
    
  rescue 
    binding.pry
  end
end
# puts final_hash

# team_doc.css("p img").map { |img| puts "*"*40; img.attributes }