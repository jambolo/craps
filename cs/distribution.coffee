counts = new Array(13).fill(0)
for d0 in [1..6]
  for d1 in [1..6]
    roll = d0 + d1
    counts[roll] = counts[roll] + 1

for count, i in counts[2..12]
  console.log "#{i+2}: #{count} (#{Number(count/36*100).toFixed(1)}%)"
