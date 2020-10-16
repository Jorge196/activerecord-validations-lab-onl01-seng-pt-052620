require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

    clickbait_patterns = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]

  def must_be_clickbait
    if clickbait_patterns.none?{|p| p.match title}errors.add(:title, "must_be_clickbait")
    end
  end

end
