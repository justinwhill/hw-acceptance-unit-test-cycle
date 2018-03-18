require 'rails_helper'

describe MoviesController do

  describe 'find movies whose director matches that of the current movie' do

      it 'should receive the click on Find With Same Director' do
        expect(Movie).to receive(:similar_titles).with('Aladdin')
        get :find, :title => 'Aladdin'
      end
    
      it 'should get movies with the same director' do
        similar_titles = ['Star Wars', 'THX-1138']
        expect(Movie).to receive(:similar_titles).with('Star Wars').and_return(similar_titles)
        get :find, :title => 'Star Wars'
        expect(assigns(:similar_titles)).to eql(similar_titles)
      end
    
      it 'should redirect to the home page if there is no director information' do
        expect(Movie).to receive(:similar_titles).with('Star Wars').and_return(nil)
        get :find, :title => 'Star Wars'
        expect(response).to redirect_to(movies_path)
      end
  
  end

  describe 'create' do
      
      movie = {:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas'}
      
      after :each do
        Movie.destroy_all(:title => 'Star Wars')
      end
      
      it 'should create a movie' do
        post :create, :movie => movie
        expect(flash[:notice]).to eql('Star Wars was successfully created.')
      end
      
      it 'should redirect to the home page' do
        post :create, :movie => movie
        expect(response).to redirect_to(movies_path)
      end
      
  end

  describe 'destroy' do
      
    movie = {:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas'}
    id = nil
    
    before :each do
      id = Movie.create!(movie).id
    end
    
    it 'should redirect to the home page' do
      delete :destroy, :id => id
      expect(response).to redirect_to(movies_path)
    end
    
  end

end

