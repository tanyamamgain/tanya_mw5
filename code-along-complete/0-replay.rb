# Run this file from the top folder of the repo (where README.md is):
# bin/rails runner code-along-complete/0-replay.rb

# Craps, replayed, and checked
# The rules:
# - The first roll: 7 or 11 wins. 2, 3 or 12 loses. Anything else becomes the point.
# - Once there is a point, keep rolling until the point comes up again (the player wins)
#   or a 7 comes up (the player loses). Any other total means roll again.
#
# Real dice are random, so playing a few games proves very little. Each game below is a
# list of rolls written down ahead of time, with the result the rules say it must have.
# Same rolls in, same result out, every time. That can be checked.

# 1. Games to replay: the rolls, and the result we expect.
games = [
  { "rolls" => [7], "expected" => "YOU WIN!" },
  { "rolls" => [12], "expected" => "YOU LOSE!" },
  { "rolls" => [8, 4, 8], "expected" => "YOU WIN!" },
  { "rolls" => [8, 7], "expected" => "YOU LOSE!" },
  { "rolls" => [8, 11, 8], "expected" => "YOU WIN!" },
  { "rolls" => [8, 2, 8], "expected" => "YOU WIN!" }
]

# 2. Replay each game
for game in games
  rolls = game["rolls"]
  result = "not played yet"

  # 4. The game, uncommented once the check had failed.
  index = 0
  total = rolls[index]
  index = index + 1

  if total == 7 || total == 11
    result = "YOU WIN!"
  elsif total == 2 || total == 3 || total == 12
    result = "YOU LOSE!"
  else
    point = total

    loop do
      total = rolls[index]
      index = index + 1

      # a game that runs out of rolls would otherwise loop forever
      if total == nil
        raise "#{rolls} ran out of rolls before the game ended"
      end

      if total == point
        result = "YOU WIN!"
        break
      elsif total == 7
        result = "YOU LOSE!"
        break
      end
    end
  end
  # end of the game

  # 3. The check: the result we got against the result we expected.
  #    Written and run before the game was in, so we saw it fail first:
  #    FAIL [7]: expected YOU WIN!, got not played yet
  if result == game["expected"]
    puts "PASS #{rolls}"
  else
    raise "FAIL #{rolls}: expected #{game["expected"]}, got #{result}"
  end
end

# Six PASS lines. They mean something because we watched the check fail first.
# Change == to = in the check and it passes everything, even a game that's wrong.
