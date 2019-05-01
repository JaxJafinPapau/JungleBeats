# JungleBeats is an example of a simple linked list built in ruby 2.4.1 for the Turing School of Software and Design.
No runner file is provided. Please fork and clone this repository to run. From the root folder of the repository on your local machine, open a pry or irb session and run the following commands:

require './lib/jungle_beats.rb'
#should return true

jb = JungleBeat.new

jb.append("put whatever cool beats you want here")
#should return your beats in string format

jb.play
#groove on
