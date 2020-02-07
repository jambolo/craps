PAYOUT_PASS = 2 # 1 to 1
PAYOUT_ODDS_4_10 = 3 # 2 to 1
PAYOUT_ODDS_5_9 = 2.5 # 3 to 2
PAYOUT_ODDS_6_8 = 2.2 # 6 to 5
NTRIALS = 10000000

randomRoll = () ->
  ~~(Math.random() * 6) + ~~(Math.random() * 6) + 2

pointCounts = new Array(13).fill(0)
pointWins = new Array(13).fill(0)
wins = 0
for j in [0...NTRIALS]
  done = false

  # off phase
  phaseOn = false
  until phaseOn or done
    roll = randomRoll()
    switch roll
      when 2, 3, 12 then done = true
      when 7, 11
        wins = wins + 1
        done = true
      else
        point = roll
        phaseOn = true

  # on phase
  if not done
    pointCounts[point] = pointCounts[point] + 1
    until done
      roll = randomRoll()
      if roll is 7
        done = true
      else if roll == point
        wins = wins + 1
        pointWins[point] = pointWins[point] + 1
        done = true


console.log "After #{NTRIALS} trials,"
console.log "wins = #{wins} (#{Number(wins/NTRIALS*100).toFixed(1)}%), return = #{Number(PAYOUT_PASS*wins/NTRIALS).toFixed(3)}"
console.log "odds bet  4, wins = #{pointWins[ 4]} out of #{pointCounts[ 4]} (#{Number(pointWins[ 4]/pointCounts[ 4]*100).toFixed(1)}%), return = #{Number(PAYOUT_ODDS_4_10*pointWins[ 4]/pointCounts[ 4]).toFixed(2)}"
console.log "odds bet  5, wins = #{pointWins[ 5]} out of #{pointCounts[ 5]} (#{Number(pointWins[ 5]/pointCounts[ 5]*100).toFixed(1)}%), return = #{Number(PAYOUT_ODDS_5_9 *pointWins[ 5]/pointCounts[ 5]).toFixed(2)}"
console.log "odds bet  6, wins = #{pointWins[ 6]} out of #{pointCounts[ 6]} (#{Number(pointWins[ 6]/pointCounts[ 6]*100).toFixed(1)}%), return = #{Number(PAYOUT_ODDS_6_8 *pointWins[ 6]/pointCounts[ 6]).toFixed(2)}"
console.log "odds bet  8, wins = #{pointWins[ 8]} out of #{pointCounts[ 8]} (#{Number(pointWins[ 8]/pointCounts[ 8]*100).toFixed(1)}%), return = #{Number(PAYOUT_ODDS_6_8 *pointWins[ 8]/pointCounts[ 8]).toFixed(2)}"
console.log "odds bet  9, wins = #{pointWins[ 9]} out of #{pointCounts[ 9]} (#{Number(pointWins[ 9]/pointCounts[ 9]*100).toFixed(1)}%), return = #{Number(PAYOUT_ODDS_5_9 *pointWins[ 9]/pointCounts[ 9]).toFixed(2)}"
console.log "odds bet 10, wins = #{pointWins[10]} out of #{pointCounts[10]} (#{Number(pointWins[10]/pointCounts[10]*100).toFixed(1)}%), return = #{Number(PAYOUT_ODDS_4_10*pointWins[10]/pointCounts[10]).toFixed(2)}"
