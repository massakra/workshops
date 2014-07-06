class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :description, :title, :price
  validates_format_of :price, :with => /\A\d+\.*\d{0,2}\z/

  def average_rating
    rating_sum = 0
    self.reviews.each do |r|
      rating_sum += r.rating
    end
    rating_sum / self.reviews.size.to_f
  end
end
