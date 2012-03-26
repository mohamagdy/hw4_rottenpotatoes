require 'spec_helper'

describe MoviesController do
  describe "similar movies" do
    it "similar movies with a given director" do
      Movie.create!(:title => "Movie 1", :director => "Director 1")
      Movie.create!(:title => "Movie 2", :director => "Director 1")
      
      Movie.should_receive(:find_similar_movies_to).with(Movie.first).and_return([Movie.first, Movie.last])
      get :similar_movies, {:id => Movie.first.id}
    end
    
    it "similar movies without a given director" do
      Movie.create!(:title => "Movie 1")
      Movie.create!(:title => "Movie 2")
      
      get :similar_movies, {:id => Movie.first.id}
      response.should redirect_to(movies_path)
    end
  end
  
  describe "list movies" do
    it "similar movies with a given director" do
      Movie.create!(:title => "Movie 1", :director => "Director 1")
      Movie.create!(:title => "Movie 2", :director => "Director 1")
      
      Movie.should_receive(:find_similar_movies_to).with(Movie.first).and_return([Movie.first, Movie.last])
      get :similar_movies, {:id => Movie.first.id}
    end
    
    it "similar movies without a given director" do
      Movie.create!(:title => "Movie 1")
      Movie.create!(:title => "Movie 2")
      
      get :similar_movies, {:id => Movie.first.id}
      response.should redirect_to(movies_path)
    end
  end
end
