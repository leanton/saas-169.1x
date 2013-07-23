#!/usr/bin/env ruby

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  m1.upcase!
  m2.upcase!
  raise NoSuchStrategyError unless ((m1 == "S") || (m1 == "R") || (m1 == "P")) && ((m2 == "S") || (m2 == "R") || (m2 == "P"))
  if (m1 == "S" && m2 =="S") || (m1 == "P" && m2 =="P") || (m1 == "R" && m2 =="R") || (m1 == "R" && m2 =="S") || (m1 == "P" && m2 =="R") || (m1 == "S" && m2 =="P")
  	return 0
  else
  	return 1
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  m1 = game[0][1].upcase
  m2 = game[1][1].upcase
  raise NoSuchStrategyError unless ((m1 == "S") || (m1 == "R") || (m1 == "P")) && ((m2 == "S") || (m2 == "R") || (m2 == "P"))
  index = rps_result(m1, m2)
  return game[index]
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a? String
  	return rps_game_winner(tournament)
  else
  	return rps_game_winner([rps_tournament_winner(tournament[0]),rps_tournament_winner(tournament[1])])
  end
end

##This is checking code for my own use ##

puts rps_result('S', 'P')
print rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ]) # Dave would win since S > P
tour = [[[["Dion", "P"], ["Leland", "P"]], [["Saraph", "P"], ["Tracy", "P"]]], [[["Aric", "S"], ["Demetris", "R"]], [["Isidoros", "S"], ["Brook", "R"]]]]

print rps_tournament_winner(tour)