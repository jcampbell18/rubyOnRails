require_relative 'classes/radio'

fm = Radio.fm
puts fm.status
fm.volume = 8
puts fm.status
fm.volume = 15
puts fm.status
fm.freq = 85.5
puts fm.status
fm.freq = 88.5
puts fm.status
puts
am = Radio.am
puts am.status
am.volume = 8
puts am.status
am.volume = 15
puts am.status
am.freq = 85.5
puts am.status
am.freq = 1000.6
puts am.status
