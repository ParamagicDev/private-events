class User < ApplicationRecord
  # prepopulates the creator_id when calling user.events.build()
  # foreign key is the id passed instead of the typical user_id
  has_many :events, foreign_key: 'creator_id'

  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { maximum: 50 }
end
