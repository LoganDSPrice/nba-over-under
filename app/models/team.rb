# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  city       :string
#  conference :string
#  division   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  nba_id     :string
#

class Team < ApplicationRecord
  has_many :season_lines, dependent: :destroy
  has_many :picks, through: :season_lines

  TEAM_COLORS = {
    'Atlanta Hawks' => {
      'style' => 'background-color:#e03a3e;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/02/Atlanta-Hawks-Logo-PNG.png'
    },
    'Boston Celtics' => {
      'style' => 'background-color:#007a33;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/02/Boston-Celtics-Logo-PNG.png'
    },
    'Brooklyn Nets' => {
      'style' => 'background-color:#fff;color:#333',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Brooklyn-Nets-Logo-PNG.png'
    },
    'Charlotte Hornets' => {
      'style' => 'background-color:#1d1160;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/02/Charlotte-Hornets-Logo-PNG.png'
    },
    'Chicago Bulls' => {
      'style' => 'background-color:#ce1141;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/02/Chicago-Bulls-Logo-PNG.png'
    },
    'Cleveland Cavaliers' => {
      'style' => 'background-color:#860038;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/02/Cleveland-Cavaliers-Logo-PNG.png'
    },
    'Dallas Mavericks' => {
      'style' => 'background-color:#00538c;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Dallas-Mavericks-Logo-PNG.png'
    },
    'Denver Nuggets' => {
      'style' => 'background-color:#fec524;color:#000',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Denver-Nuggets-Logo-PNG.png'
    },
    'Detroit Pistons' => {
      'style' => 'background-color:#c8102e;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Detroit-Pistons-Logo-PNG.png'
    },
    'Golden State Warriors' => {
      'style' => 'background-color:#1d428a;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Golden-State-Warriors-Logo-PNG.png'
    },
    'Houston Rockets' => {
      'style' => 'background-color:#000;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Houston-Rockets-Logo-PNG.png'
    },
    'Indiana Pacers' => {
      'style' => 'background-color:#002d62;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Indiana-Pacers-Logo-PNG.png'
    },
    'LA Clippers' => {
      'style' => 'background-color:#c8102e;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Los-Angeles-Clippers-Logo-PNG.png'
    },
    'Los Angeles Lakers' => {
      'style' => 'background-color:#552583;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Los-Angeles-Lakers-Logo-PNG.png'
    },
    'Memphis Grizzlies' => {
      'style' => 'background-color:#5d76a9;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Memphis-Grizzlies-Logo-PNG.png'
    },
    'Miami Heat' => {
      'style' => 'background-color:#98002e;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Miami-Heat-Logo-PNG.png'
    },
    'Milwaukee Bucks' => {
      'style' => 'background-color:#00471b;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Milwaukee-Bucks-Logo-PNG.png'
    },
    'Minnesota Timberwolves' => {
      'style' => 'background-color:#0c2340;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Minnesota-Timberwolves-Logo-PNG.png'
    },
    'New Orleans Pelicans' => {
      'style' => 'background-color:#0c2340;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/06/New-Orleans-Pelicans-Logo-PNG.png'
    },
    'New York Knicks' => {
      'style' => 'background-color:#006bb6;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/New-York-Knicks-Logo-PNG.png'
    },
    'Oklahoma City Thunder' => {
      'style' => 'background-color:#007ac1;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Oklahoma-City-Thunder-Logo-PNG.png'
    },
    'Orlando Magic' => {
      'style' => 'background-color:#0077c0;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Orlando-Magic-Logo-PNG.png'
    },
    'Philadelphia 76ers' => {
      'style' => 'background-color:#006bb6;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2017/03/Philadelphia-76ers-Logo-PNG.png'
    },
    'Phoenix Suns' => {
      'style' => 'background-color:#1d1160;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/03/Phoenix-Suns-Logo-PNG.png'
    },
    'Portland Trail Blazers' => {
      'style' => 'background-color:#e03a3e;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2018/03/Portland-Trail-Blazers-Logo-PNG.png'
    },
    'Sacramento Kings' => {
      'style' => 'background-color:#5a2d81;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/03/Sacramento-Kings-Logo-PNG.png'
    },
    'San Antonio Spurs' => {
      'style' => 'background-color:#c4ced4;color:#000',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/03/San-Antonio-Spurs-Logo-PNG.png'
    },
    'Toronto Raptors' => {
      'style' => 'background-color:#ce1141;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/03/Toronto-Raptors-Logo-PNG.png'
    },
    'Utah Jazz' => {
      'style' => 'background-color:#002b5c;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/03/Utah-Jazz-Logo-PNG.png'
    },
    'Washington Wizards' => {
      'style' => 'background-color:#002b5c;color:#fff',
      'logo_src_url' => 'https://teamcolorcodes.com/wp-content/uploads/2015/03/Washington-Wizards-Logo-PNG.png'
    }
}

  def style
    Team::TEAM_COLORS["#{city} #{name}"]['style']
  end
  
  def img_url
    Team::TEAM_COLORS["#{city} #{name}"]['logo_src_url']
  end
end
