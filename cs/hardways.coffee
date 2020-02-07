PAYOUT_4_10 = 8 # 7 to 1
PAYOUT_6_8 = 10 # 9 to 1

NTRIALS = 1000000
counts = new Array(7).fill(0)

randomRoll = () ->
  ~~(Math.random() * 6) + 1

console.log "After #{NTRIALS} trials for each number,"
for i in [1..6]
  wins = 0
  for j in [0...NTRIALS]
    d0 = randomRoll()
    d1 = randomRoll()
    until d0 + d1 == 7 or d0 + d1 == i * 2
      d0 = randomRoll()
      d1 = randomRoll()

    if d0 == d1
      wins = wins + 1 

  switch i
    when 2 then console.log "for hard #{i*2}, wins = #{wins} (#{wins/NTRIALS*100}%), return = #{PAYOUT_4_10*wins/NTRIALS}"
    when 3 then console.log "for hard #{i*2}, wins = #{wins} (#{wins/NTRIALS*100}%), return = #{PAYOUT_6_8*wins/NTRIALS}"
    when 4 then console.log "for hard #{i*2}, wins = #{wins} (#{wins/NTRIALS*100}%), return = #{PAYOUT_6_8*wins/NTRIALS}"
    when 5 then console.log "for hard #{i*2}, wins = #{wins} (#{wins/NTRIALS*100}%), return = #{PAYOUT_4_10*wins/NTRIALS}"
