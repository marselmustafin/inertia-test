class Animal < ApplicationRecord
  has_one_attached :photo

  enum gender: { boy: 'boy', girl: 'girl', nb: 'nb' }

  validates :name, :age, :kind, :gender, presence: true

  def as_json(options = nil)
    photo_url = Rails.application.routes.url_helpers.url_for(photo) if photo.attached?

    super.merge('photo_url' => photo_url)
  end
end
