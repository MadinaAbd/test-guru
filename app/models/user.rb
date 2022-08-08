class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests, dependent: :destroy
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true

  #scope :level_test, -> (level) { tests.where(level: level) }

  def level_test(level)
    tests.where(level: level)
  end

end


