require_relative 'initializer'

class Player
    extend API::Request

    # returns daily fantasy players with salaries by ADP
    def self.all
        request_service('FantasyPlayers')
    end

    # returns players with injuries
    def self.injuries week
        request_service('Injuries', [CoreExtensions::Fantasy::Date.last_season, week])
    end

    # returns inactive players
    def self.inactive
        self.injuries(5).select { |player| player['DeclaredInactive'] if player['DeclaredInactive'] == true}
    end

    # returns news about a player
    def self.news id
        request_service('NewsByPlayerID', id)
    end

    # returns recent news
    def self.recent_news
        request_service('News')
    end

    # returns players and projections for the current week
    def self.daily_players
        request_service('DailyFantasyPlayers', CoreExtensions::Fantasy::Date.current_date)
    end

    # returns players and points scored for the week
    def self.fantasy_points options = {}
        request_service('DailyFantasyPoints', CoreExtensions::Fantasy::Date.current_date)
    end

    # returns league leaders in fantasy points based on position
    def self.point_leaders position, type
        request_service('SeasonLeagueLeaders', [CoreExtensions::Fantasy::Date.last_season, position, type])
    end

    # retuns league leaders by week in fantasy points by position
    def self.point_leaders_by_week position, week
        request_service('GameLeagueLeaders', [CoreExtensions::Fantasy::Date.last_season, week, position, 'FantasyPoints'])
    end

    # returns player projections by game
    def self.player_projections_by_game id, week
        request_service('PlayerGameProjectionStatsByPlayerID', [CoreExtensions::Fantasy::Date.last_season, week, id])
    end

    # returns player projections for season
    def self.player_projections_by_season
        request_service('PlayerSeasonProjectionStats', CoreExtensions::Fantasy::Date.regular_season)
    end

    # returns player projections by player
    def self.player_projections_by_player id
        request_service('PlayerSeasonProjectionStatsByPlayerID', [CoreExtensions::Fantasy::Date.regular_season, id])
    end

end