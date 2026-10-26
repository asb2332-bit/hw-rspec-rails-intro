require 'rails_helper'
require 'spec_helper'

describe Movie do
  describe 'searching Tmdb by keyword' do
    it 'calls Faraday' do
      expect(Faraday).to receive(:get).and_call_original
      Movie.find_in_tmdb(title: 'hacker', language: 'en')
    end

    it 'calls Tmdb with valid API key' do
      movies = Movie.find_in_tmdb({ title: 'hacker', language: 'en' }, 'test-key')

      expect(movies.first).to have_attributes(title: 'Sydney 2000 Olympics Opening Ceremony', rating: 'R')
      expect(movies.first).not_to be_persisted
    end
  end
end
