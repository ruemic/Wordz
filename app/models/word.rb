class Word < ActiveRecord::Base
  attr_accessible :correct, :word, :created_at, :updated_at
end
