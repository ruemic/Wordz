Word.delete_all

def create_word(incorrect, correct)
  Word.create! incorrect: incorrect, correct: correct
  puts "#{incorrect}: #{correct}"
end

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