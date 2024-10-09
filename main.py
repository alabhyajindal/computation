def run(dfa, word):
    current_state = dfa['initial_state']

    for i, char in enumerate(word):
        current_state = dfa['transitions'][current_state][char]

    if current_state in dfa['accepting_states']:
        print(f'{word} ACCEPT')
    else:
        print(f'{word} REJECT')

# DFA accepting even number of 0s
even_zeros = {
    'accepting_states': ['q1'], 'initial_state': 'q1',
    'transitions': {
        'q1': {'1': 'q1', '0': 'q2'},
        'q2': {'1': 'q2', '0': 'q1'}
    }
}

word_1 = '10110'
word_2 = '000'
word_3 = '010'

run(even_zeros, word_1)
run(even_zeros, word_2)
run(even_zeros, word_3)

# DFA accepting comments
comments = {
    'accepting_states': ['q5'], 'initial_state': 'q1',
    'transitions': {
        'q1': {'*': 'bar'}
    }
}

print(comments['transitions']['*'])

