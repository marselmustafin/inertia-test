class Animal < ApplicationRecord
  has_one_attached :photo

  enum animal_class: { mammal: 'mammal', bird: 'bird', fish: 'fish' }

  validates :name, :age, :kind, :animal_class, presence: true

  def as_json(options = nil)
    photo_url = Rails.application.routes.url_helpers.url_for(photo) if photo.attached?

    super.merge('photo_url' => photo_url)
  end
end
