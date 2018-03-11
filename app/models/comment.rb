class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  RATINGS = {
    'one star': '1_star',
    'two star': '2_stars',
    'three star': '3_stars',
    'four star': '4_stars',
    'five star': '5_stars',
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
