# beer_song.rb

=begin
Problem
Create an instance method that takes a list of integers and outputs the relevant verses 
of the song, #verse
Create a class method that outputs the whole song, #self.lyrics

Examples
p BeerSong.verse(0) # no bottles of beer on the wall
p BeerSong.verse(99) # 99 bottles of beer
p BeerSong.verse(99, 98) # two verses
p BeerSong.verse(2, 0) # three verses
p BeerSong.lyrics # whole song

Data
Inputs: integers
Output: string

Algorithm for #self.lyrics
Invoke #verse(99, 0)

Algorithm for #verse
Take a single argument or pair of arguments
Iterate from first to second argument in steps of 1
  For 99-3, output number bottles of beer, take one down, one less bottles of beer
  For 2, output number bottles of beer, take one down, 1 bottle of beer on the wall
  For 1, output 1 bottle of beer, take it down, no more bottles of beer
  For 0, output no more bottles of beer, go to the store, 99 botltles of beer

=end