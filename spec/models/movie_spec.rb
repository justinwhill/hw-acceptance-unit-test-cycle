require 'rails_helper'

describe Movie do
    
    describe 'find movies whose director matches that of the current movie' do

        movie_1 = {:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas'}
        movie_2 = {:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott'}
        movie_3 = {:title => 'Alien', :rating => 'R', :director => ''}
        movie_4 = {:title => 'THX-1138', :rating => 'R', :director => 'George Lucas'}

        before :all do
            Movie.create!(movie_1)
            Movie.create!(movie_2)
            Movie.create!(movie_3)
            Movie.create!(movie_4)
        end

        context 'when the specified movie has a director' do
            it 'should find movies by the same director' do
                expect(Movie.similar_titles(movie_1[:title])).to eql(['Star Wars', 'THX-1138'])
            end
            
            it 'should not find movies by different directors' do
                expect(Movie.similar_titles(movie_1[:title])).to_not include(['Blade Runner', 'Alien'])
            end
        end
        
        context 'when the specified movie has no director' do
            it 'should return nil' do
               expect(Movie.similar_titles(movie_3[:title])).to eql(nil) 
            end
        end
        
        after :all do
            Movie.destroy_all(title: [movie_1[:title], movie_2[:title], movie_3[:title], movie_4[:title]])
        end

    end
    
end




# a model method in the Movie model to find movies whose director matches that of
# the current movie. Note: This implies that you should write at least 2 specs for
# your controller: 1) When the specified movie has a director, it should... 2)
# When the specified movie has no director, it should ... and 2 for your model: 1)
# it should find movies by the same director and 2) it should not find movies by
# different directors.