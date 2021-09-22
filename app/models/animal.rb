class Animal < ApplicationRecord
  enum gender: { boy: 'boy', girl: 'girl', nb: 'nb' }

  validates :name, :age, :kind, :gender, presence: true
end
