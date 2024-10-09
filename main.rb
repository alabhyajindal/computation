def run(dfa, word)
  current_state = dfa[:initial_state]
  word.each_char do |char|
    next_state = dfa[:transitions][current_state][char]
    if next_state then current_state = next_state end
  end
  if dfa[:accepting_states].include?(current_state)
    puts "#{word} ACCEPT"
  else
    puts "#{word} REJECT"
  end
end

# DFA accepting even number of 0s
even_zeros = {
  accepting_states: ['q1'],
  initial_state: 'q1',
  transitions: {
    'q1' => {'1' => 'q1', '0' => 'q2'},
    'q2' => {'1' => 'q2', '0' => 'q1'}
  }
}

# Test cases
even_zeros_word1 = '10110'
even_zeros_word2 = '000'
even_zeros_word3 = '010'

puts('DFA accepting even number of 0s')
run(even_zeros, even_zeros_word1)
run(even_zeros, even_zeros_word2)
run(even_zeros, even_zeros_word3)

# DFA accepting comments of a specific PL
comments = {
  accepting_states: ['q5'],
  initial_state: 'q1',
  transitions: {
    'q1' => {'*' => 'q2'},
    'q2' => {'#' => 'q3'},
    'q3' => {'#' => 'q4', 'a' => 'q3', 'b' => 'q3'},
    'q4' => {'*' => 'q5'}
  }
}

# Test cases
comments_word1 = '*#ab#*'
comments_word2 = '*#b'
comments_word3 = '*#abaaa#*'

puts("\nDFA accepting comments of a specific PL")
run(comments, comments_word1)
run(comments, comments_word2)
run(comments, comments_word3)
