# This file is a transcript of the IRB session shown in the movie.
# You should be able to cut and paste it into IRB to get 
# similar results shown in the comments.

# irb
Time.now
# => 2018-10-10 11:19:14 -0400
Time.now.to_i
# => 1539184759
Time.at(1539184759)
# => 2018-10-10 11:19:19 -0400
t = Time.now
# => 2018-10-10 11:19:48 -0400
t + (60 * 60 * 24)
# => 2018-10-11 11:19:48 -0400
t + (60 * 60 * 24 * 7)
# => 2018-10-17 11:19:48 -0400
t + (60 * 60 * 24 * 365)
# => 2019-10-10 11:19:48 -0400
Time.now == Time.now
# => false
Time.now.nsec == Time.now.nsec
# => false
Time.now.nsec 
# => 843586000
Time.now.nsec
# => 932670000
t.year
# => 2018
t.month
# => 10
t.day
# => 10
t.yday
# => 283
t.wday
# => 3
t.wednesday?
# => true
t.monday?
# => false
t.zone
# => "EDT"
t.dst?
# => true
t.utc
# => 2018-10-10 15:19:48 UTC
t.gmtime
# => 2018-10-10 15:19:48 UTC
exit
