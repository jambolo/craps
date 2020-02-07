SMALL_PAYOUT = 31
ALL_PAYOUT = 151
TALL_PAYOUT = 31
NTRIALS = 10000000
distribution = new Array(13).fill(0)
nRolls = 0

smallWin = (state) ->
  for i in state[2..6]
     return false if i isnt 1
  return true

tallWin = (state) ->
  for i in state[8..12]
     return false if i isnt 1
  return true
  
allWin = (state) ->
  return smallWin(state) and tallWin(state)

randomRoll = () ->
  roll = ~~(Math.random() * 6) + ~~(Math.random() * 6) + 2
  distribution[roll] = distribution[roll] + 1
  nRolls = nRolls + 1
  return roll

nSmallWins = 0
nTallWins = 0
nAllWins = 0

for i in [0...NTRIALS]
  state = new Array(13).fill(0)
  small = false
  tall = false
  all = false

  roll = randomRoll()
  while roll isnt 7 and not all
    state[roll] = 1
    if not small and smallWin(state)
      small = true
      nSmallWins = nSmallWins + 1
    if not tall and tallWin(state)
      tall = true
      nTallWins = nTallWins + 1
    if not all and allWin(state)
      all = true
      nAllWins = nAllWins + 1
    roll = randomRoll()

console.log "After #{NTRIALS} trials,"
console.log "small wins = #{nSmallWins} (#{Number(nSmallWins/NTRIALS*100).toFixed(1)}%), return = #{Number(nSmallWins*SMALL_PAYOUT/NTRIALS).toFixed(2)}"
console.log "tall wins  = #{nTallWins} (#{Number(nTallWins/NTRIALS*100).toFixed(1)}%), return = #{Number(nTallWins *TALL_PAYOUT/NTRIALS).toFixed(2)}"
console.log "all wins   = #{nAllWins} (#{Number(nAllWins/NTRIALS*100).toFixed(1)}%), return = #{Number(nAllWins*ALL_PAYOUT/NTRIALS).toFixed(2)}"
