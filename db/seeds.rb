# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


Word.delete_all
open("public/wordz.txt") do |words|
  words.read.each_line do |word|
    incorrect, correct = word.chomp.split("->")
    Word.create!(:word => incorrect, :correct => false) unless incorrect.include? ","
    Word.create!(:word => correct,   :correct => true ) unless correct.include? ","
  end
end
