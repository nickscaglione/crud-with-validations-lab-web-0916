class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :artist_name, presence: true
  validate :not_future
  validate :year_if_released

  def not_future
    if self.release_year
      errors.add(:release_year, "Your release year is in the future!") if self.release_year >= Time.now.year
    end
  end

  def year_if_released
      errors.add(:release_year, "You must specify the release year if the song is out") if self.released && !self.release_year
  end


end
