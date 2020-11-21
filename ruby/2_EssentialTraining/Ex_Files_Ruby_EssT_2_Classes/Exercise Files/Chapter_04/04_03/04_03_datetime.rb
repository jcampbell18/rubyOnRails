# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# similar results shown in the comments.

# irb
require 'date'
# => true
DateTime.now
# => #<DateTime: 2018-10-10T12:11:26-04:00 ((2458402j,58286s,180559000n),-14400s,2299161j)>
DateTime.new(2000, 1, 1, 2, 45, 0, '+7')
# => #<DateTime: 2000-01-01T02:45:00+07:00 ((2451544j,71100s,0n),+25200s,2299161j)>
DateTime.new(2000, 1, 1, 2, 45, 0, '+7').month
# => 1
DateTime.new(2000, 1, 1, 2, 45, 0, '+7').hour
# => 2
DateTime.now.to_time
# => 2018-10-10 12:12:07 -0400
DateTime.now.to_time.class
# => Time
Time.now.to_datetime
# => #<DateTime: 2018-10-10T12:12:16-04:00 ((2458402j,58336s,848729000n),-14400s,2299161j)>
Time.now.to_datetime.class
# => DateTime
exit
