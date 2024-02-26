class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true

  before_destroy :destroy_child_saved_movies

  private

  def destroy_child_saved_movies
    self.movies.destroy_all
  end
end
