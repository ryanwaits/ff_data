# Fantasy Data API Ruby Gem

A Ruby Gem for the Fantasy Data API

This gem currently supports the free trial and premium subscriptions from Fantasy Data.

Here's what you get access to with this gem:

* Player stats
* Rankings (Weekly/Seasonal)
* Projections (Weekly/Seasonal)
* DFS Salaries
* Average Draft Position (ADP)
* Injuries
* Inactives
* Games in progress
* Recent news
* Box scores
* Games in progress
* Recent news
* Schedule
* Standings
* And more...

## v2.0

The current version of the Fantasy Data API is v2 and is what this version of the gem is compatible with.

## Cache your data

> Most of the data does not generally change more than a few times per day, so it becomes unnecessary to continually make the
> same calls. Please store the results locally and reference the cached responses.

# Setup

First, sign up for a Fantasy Data account.

Then go ahead and install the gem:

    $ gem install ff_data

And require it: 

    require 'rubygems'
    require 'ff_data'

If you're using Rails or Sinatra, add the gem to your Gemfile and run ```bundle install```
 
    gem 'ff_data'
   
Set an environment variable via the terminal (good for production environments where you don't want to commit credentials to a repo).

    export FANTASY_DATA_KEY="ABC123DEF456"

Set a class variable from your script (good for one-offs like pulling down stats from IRB).

    FantasyData.api_key = "ABC123DEF456"

# API Resources

## Teams

Return news about a team

    Team.news team

    => [{"Title"=>"Cardinals site: David Johnson is clear RB1", "Url"=>http://www.rotoworld.com/player/nfl/10404/david-johnson"}, ...]

Return teams and their bye weeks

    Team.byes

    => [{"Season"=>2016, "Week"=>4, "Team"=>"GB"},{"Season"=>2016, "Week"=>4, "Team"=>"PHI"},{"Season"=>2016, "Week"=>5, "Team"=>"JAX"},{"Season"=>2016, "Week"=>5, "Team"=>"KC"}, ...]

Return teams based on week

    Team.bye_week week

    => [{"Season"=>2016, "Week"=>9, "Team"=>"ARI"},{"Season"=>2016, "Week"=>9, "Team"=>"CHI"},{"Season"=>2016, "Week"=>9, "Team"=>"CIN"}, ...]

Return all team defense stats for the week

    Team.defenses week

    => [{"ScoringDetails"=>[],"GameKey"=>"201510511","SeasonType"=>1,"Season"=>2015,"Week"=>5,"Date"=>"2015-10-11T16:05:00","Team"=>"ARI","Opponent"=>"DET","PointsAllowed"=>19,"TouchdownsScored"=>0,"SoloTackles"=>63,"AssistedTackles"=>18,"Sacks"=>1, ...}]

Return a teams defense stats for the week
    
    Team.defense team, week

    => {"ScoringDetails"=>[],"GameKey"=>"201510101","SeasonType"=>1,"Season"=>2015,"Week"=>1,"Date"=>"2015-09-13T16:05:00","Team"=>"ARI","Opponent"=>"NO","PointsAllowed"=>21,"TouchdownsScored"=>0,"SoloTackles"=>57,"AssistedTackles"=>12,"Sacks"=>2,...}]

Return defense scoring stats for the season

    Team.defense_scoring

    => [{"ScoringDetails"=>[{"GameKey"=>"201510206","SeasonType"=>1,"PlayerID"=>15516,"Team"=>"ARI","Season"=>2015,"Week"=>2,"ScoringType"=>"InterceptionReturnTouchdown","Length"=>29,...}]]

Return defense scoring stats by team

    Team.defense_scoring_by_team team

    => {"ScoringDetails"=>[{"GameKey"=>"201510216","SeasonType"=>1,"PlayerID"=>16779,"Team"=>"KC","Season"=>2015,"Week"=>2,"ScoringType"=>"InterceptionReturnTouchdown","Length"=>61,...}]

Return defense projections for the season

    Team.defense_projections

    => [{"SeasonType"=>1,"Season"=>2015,"Team"=>"ARI","PointsAllowed"=>336,"TouchdownsScored"=>4,"SoloTackles"=>774,"AssistedTackles"=>167,"Sacks"=>43,...}]

Return scores

    Team.scores

    => [{..."AwayTeam"=>"PIT","HomeTeam"=>"NE","AwayScore"=>23,"HomeScore"=>31,"Channel"=>"NBC",...}]

Return scores by week

    Team.scores_by_week week

    => [{..."AwayTeam"=>"IND","HomeTeam"=>"HOU","AwayScore"=>30,"HomeScore"=>22,"Channel"=>"CBS/NFL",...}]

Return schedule

    Team.schedule

    => [{..."GameKey"=>"201610110","SeasonType"=>1,"Season"=>2016,"Week"=>1,"Date"=>"2016-09-08T20:30:00","AwayTeam"=>"CAR","HomeTeam"=>"DEN",...}]

Return standings

    Team.standings

    => [{"SeasonType"=>1,"Season"=>2015,"Conference"=>"AFC","Division"=>"East","Team"=>"NE","Name"=>"New England Patriots","Wins"=>12,"Losses"=>4,...}]

## Players

Return all players

    Player.all

    => [{"FantasyPlayerKey"=>"11056","PlayerID"=>11056,"Name"=>"Antonio Brown","Team"=>"PIT","Position"=>"WR","AverageDraftPosition"=>1.7,"AverageDraftPositionPPR"=>1.5,"ByeWeek"=>8,"LastSeasonFantasyPoints"=>277.5,"ProjectedFantasyPoints"=>252.9,"AuctionValue"=>73,"AuctionValuePPR"=>76},...]

Return injuries by week

    Player.injuries week

    => [{"InjuryID"=>46273,"SeasonType"=>1,"Season"=>2015,"Week"=>3,"PlayerID"=>722,"Name"=>"Jason Witten","Position"=>"TE",...}]

Return inactive

    Player.inactive 

    => [{"InjuryID"=>48742,"SeasonType"=>1,"Season"=>2015,"Week"=>5,"PlayerID"=>2950,"Name"=>"Steve Johnson","Position"=>"WR","Number"=>11,"Team"=>"SD",..}]

Return news for a player

    Player.news id

    => [{"NewsID"=>41807,"Title"=>"Roethlisberger: Let's go for 2 after every TD","Updated"=>"2016-06-15T06:28:00","Url"=>"http://www.rotoworld.com/player/nfl/1181/ben-roethlisberger","Content"=>"Ben Roethlisberger said Tuesday he wants the Steelers to go for two-point conversions after every touchdown this season.","Source"=>"NBCSports.com","TermsOfUse"=>"NBCSports.com feeds in the RSS format are provided free of charge for use by individuals for personal, non-commercial uses. More details here: http://fantasydata.com/resources/rotoworld-rss-feed.aspx","Team"=>"PIT","PlayerID"=>3807},...]

Return all recent news

    Player.recent_news

    => [{"NewsID"=>42052,"Title"=>"Brandin Cooks 'looks ready to explode' in '16","Updated"=>"2016-07-20T13:17:00","Url"=>"http://www.rotoworld.com/player/nfl/9404/brandin-cooks","Content"=>"Per ESPN Saints reporter Mike Triplett, Brandin Cooks &quot;looks ready to explode&quot; this season.","Source"=>"NBCSports.com","TermsOfUse"=>"NBCSports.com feeds in the RSS format are provided free of charge for use by individuals for personal, non-commercial uses. More details here: http://fantasydata.com/resources/rotoworld-rss-feed.aspx","Team"=>"NO","PlayerID"=>16568},...]

Return projections for current week

    Player.daily_players

    => Data will be filled at the start of the season

Return points scored for the week

    Player.fantasy_points

    => Data will be filled at the start of the season

Return point leaders by position

    Player.point_leaders position, category
    
    # Categories: ['FantasyPoints', 'PassingYards', 'RushingYards', 'Receptions', 'Sacks', 'Interceptions', 'Touchdowns']

    => {"CustomD365FantasyPoints"=>304.0,"ScoringDetails"=>[{"GameKey"=>"201510215","SeasonType"=>1,"PlayerID"=>16263,"Team"=>"JAX","Season"=>2015,"Week"=>2,"ScoringType"=>"ReceivingTouchdown","Length"=>3,"ScoringDetailID"=>439837,"PlayerGameID"=>14621530}, ...}]]

Return point leaders by week

    Player.point_leaders_by_week position, week

    => [{"CustomD365FantasyPoints"=>37.2,"ScoringDetails"=>[{"GameKey"=>"201510206","SeasonType"=>1,"PlayerID"=>5571,"Team"=>"ARI","Season"=>2015,"Week"=>2,"ScoringType"=>"ReceivingTouchdown","Length"=>31,"ScoringDetailID"=>439744,"PlayerGameID"=>14621337}, ...}]

Return player projections by game

    Player.player_projections_by_game id, week

    => {"GameKey"=>"201510121","PlayerID"=>3807,"SeasonType"=>1,"Season"=>2015,"GameDate"=>"2015-09-10T20:30:00","Week"=>1,"Team"=>"PIT","Opponent"=>"NE","HomeOrAway"=>"AWAY","Number"=>7,"Name"=>"Ben Roethlisberger","Position"=>"QB",...}

Return player projections by season

    Player.player_projections_by_season 

    => [{"PlayerID"=>2428,"SeasonType"=>1,"Season"=>2016,"Team"=>"ARI","Number"=>3,"Name"=>"Carson Palmer","Position"=>"QB","PositionCategory"=>"OFF","Activated"=>16,"Played"=>16,"Started"=>16,"PassingAttempts"=>620,"PassingCompletions"=>386,"PassingYards"=>5024, ...}]

Return player projections by player

    Player.player_projections_by_player id

    => {"PlayerID"=>3807,"SeasonType"=>1,"Season"=>2016,"Team"=>"PIT","Number"=>7,"Name"=>"Ben Roethlisberger","Position"=>"QB","PositionCategory"=>"OFF","Activated"=>16,"Played"=>16,"Started"=>16,"PassingAttempts"=>651,"PassingCompletions"=>429,"PassingYards"=>5220, ...}

## Games

Return all scores for a given week

    Game.box_scores week

    => {"GameKey"=>"201610531","SeasonType"=>1,"Season"=>2016,"Week"=>5,"Date"=>"2016-10-06T20:25:00","AwayTeam"=>"ARI","HomeTeam"=>"SF","AwayScore"=>nil,"HomeScore"=>nil,...}

Return score for a team

    Game.box_score team, week

    => {"GameKey"=>"201610531","SeasonType"=>1,"Season"=>2016,"Week"=>5,"Date"=>"2016-10-06T20:25:00","AwayTeam"=>"ARI","HomeTeam"=>"SF","AwayScore"=>nil,"HomeScore"=>nil,...}

Return scores that are in progress

    Game.in_progress 

    => "No games in progress."

Return games that are completed

    Game.final

    => "No finished games yet."




## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ff_data. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

