class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.similar_titles movie_title
    director = Movie.find_by(title: movie_title).director
    if director.blank? or director.nil?
      return nil
    end
    Movie.where(director: director).pluck(:title)
  end
end
