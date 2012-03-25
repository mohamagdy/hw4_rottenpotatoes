class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.find_similar_movies_to(movie)
    Movie.find(:all, :conditions => ["director = ?", movie.director])
  end
end
