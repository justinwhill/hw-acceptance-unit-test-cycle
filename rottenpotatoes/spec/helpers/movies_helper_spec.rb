require 'rails_helper'

describe MoviesHelper do
    
    it 'should determine an even number is even' do
        expect(oddness(8)).to eql('even')
    end
    
    it 'should determine an odd number is odd' do
        expect(oddness(5)).to eql('odd')
    end
    
end