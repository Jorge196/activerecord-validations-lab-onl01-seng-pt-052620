require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :must_be_clickbait

  def must_be_clickbait
    if clickbait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      clickbait.none?{|word| word.include?("clickbait")}(:must_be_clickbait)
    end
  end
end
