PAYOUT_4_10 = 9 / 5 + 1 # 9 to 5
PAYOUT_5_9 = 7 / 5 + 1 # 7 to 5
PAYOUT_6_8 = 7 / 6 + 1 # 7 to 6

NTRIALS = 10000000
counts = new Array(13).fill(0)

randomRoll = () ->
  ~~(Math.random() * 6) + ~~(Math.random() * 6) + 2

console.log "After #{NTRIALS} trials for each number,"

for n in [4, 5, 6, 8, 9, 10]
  wins = 0
  for j in [0...NTRIALS]
    done = false
    until done
      roll = randomRoll()
      if roll is 7
        done = true
      else if roll == n
        wins = wins + 1
        done = true

  switch n
    when 4, 10 then console.log "place #{n}, wins = #{wins} (#{Number(wins/NTRIALS*100).toFixed(1)}%), return = #{Number(PAYOUT_4_10*wins/NTRIALS).toFixed(2)}"
    when 5,  9 then console.log "place #{n}, wins = #{wins} (#{Number(wins/NTRIALS*100).toFixed(1)}%), return = #{Number(PAYOUT_5_9*wins/NTRIALS).toFixed(2)}"
    when 6,  8 then console.log "place #{n}, wins = #{wins} (#{Number(wins/NTRIALS*100).toFixed(1)}%), return = #{Number(PAYOUT_6_8*wins/NTRIALS).toFixed(2)}"
