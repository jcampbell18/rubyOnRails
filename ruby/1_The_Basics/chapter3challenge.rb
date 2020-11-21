colors = "RRGGBBYYKK"
colors = "++*~~*++*"

0.upto(20) do |i|
  puts colors[(i%colors.length+1)..colors.length] + colors[0..i%colors.length]
end