number = 0

# A list of all possible answers.
possible_answers = File.readlines("answers/possible_answers.txt", chomp: true)

# Display list of all possible answers.
print possible_answers

# Asks you to pick your answer.
print " >> "
pick_answer = gets.chomp.strip.to_i

# Sets correct answer to your answer.
correct_answer = possible_answers[pick_answer].strip

puts " "

# Sets the loop limit to the size of the array.
size_limit = possible_answers.size.to_i

# If loop reaches the correct answer before loop limit, generates auto answer. Otherwise continue loop until end.
size_limit.times do
  answer = possible_answers[number]

  if answer == correct_answer
    print "Correct: "; puts answer

    # Generates an automatic answer from learned answer.
    open("results/#{correct_answer.tr ' ', '_'}.rb", "w") { |f|
      f.puts "puts 'Correct: #{answer}' "
    }

    abort
  else
    print "Incorrect: "; puts answer
  end

  number = number + 1
end
