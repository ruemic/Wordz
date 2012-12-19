Dream.delete_all

def create_dream(name, position)
  Dream.create! name: name, position: position
  puts "#{position}: #{name}"
end

def create_word(correct, incorrect)
  Word.create! correct: correct, incorrect: incorrect
  puts "#{correct}: #{incorrect}"
end


create_dream 'Learn to play on sax', 1
create_dream 'Dive with scuba', 2
create_dream 'Visit Iceland', 3

create_word 'apple', 'aple'
create_word 'abandonned', 'abandoned'
create_word 'aberation', 'aberration'
create_word 'abilties', 'abilities'
create_word 'abilty', 'ability'
create_word 'abondon', 'abandon'
create_word 'abbout', 'about'
create_word 'abotu', 'about'
create_word 'abscence', 'absence'
create_word 'abondoned', 'abandoned'
create_word 'abondoning', 'abandoning'
create_word 'abondons', 'abandons'
create_word 'aborigene', 'aborigine'
create_word 'accesories', 'accessories'
create_word 'accidant', 'accident'
create_word 'abortificant', 'abortifacient'