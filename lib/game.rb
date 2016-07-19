require_relative 'initializer'

class Game
    extend API::Request

    # returns a box score for a particular team
    def self.box_score team, week
        data = request_service('BoxScore', [CoreExtensions::Fantasy::Date.regular_season, week, team])['Score']
        # puts "#{data['AwayTeam']} vs. #{data['HomeTeam']}"
    end

    # returns all box scores
    def self.box_scores week
        request_service('BoxScores', [CoreExtensions::Fantasy::Date.regular_season, week])
    end

    # returns box scores for games that are in progress
    def self.in_progress
        in_progress = request_service('ActiveBoxScores')
        in_progress.nil? ? in_progress : "No games in progress."
    end

    # returns box scores for finishes games
    def self.final
        final = request_service('FinalBoxScores')
        final.nil? ? final : "No finished games yet."
    end

end