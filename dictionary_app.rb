require 'http'


puts "=" * 50

running = true

while running == true

  system "clear"
  puts "Welcome to the Dictionary App"

  print "Word to look up: "
  word = gets.chomp

  print "Type of word (e.g. noun, verb, etc.): "
  type = gets.chomp


  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{ word }/definitions?limit=200&partOfSpeech=#{ type }&includeRelated=true&sourceDictionaries=all&useCanonical=true&includeTags=false&api_key=64e90a58d89a8e7f3f000001fe809d0cd55d32cb45b9f117e")

  audio = HTTP.get("https://api.wordnik.com/v4/word.json/#{ word }/audio?useCanonical=false&limit=50&api_key=64e90a58d89a8e7f3f000001fe809d0cd55d32cb45b9f117e")

  dictionary_entry = response.parse

  audio_entry = audio.parse

  system "clear"

  index = 0
  count = 1

  audio_entry[0]["fileUrl"]

  puts "DEFINITIONS"
  puts "=" * 60

  dictionary_entry.length.times do
    # puts "Word: #{dictionary_entry[index]["word"]}"
    # puts "Type of word: #{dictionary_entry[index]["partOfSpeech"]}"
    # puts "Dictionary used: #{dictionary_entry[index]["attributionText"]}"
    # puts ""
    puts ""
    puts "(#{count}) Definition: #{dictionary_entry[index]["text"]}"
    puts ""
    #puts "=" * 50
    index += 1
    count += 1
  end

  print "Enter q to exit program: "
  running = (gets.chomp.downcase != "q")

end


# Exercise: Build a terminal dictionary app
# Create a new ruby file called dictionary_app.rb
# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: http://developer.wordnik.com/docs.html#!/word
# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
# Bonus: Write your program in a loop such that the user can keep entering new words without having to restart the program. Give them the option of entering q to quit.
# Bonus: Search for the audio section in the documentation. Use wordnik’s audio api to get the first fileUrl to open in the browser and pronounce the name of the word.
