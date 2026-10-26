require 'rails_helper'

describe MoviesController, type: :controller do
  describe 'searching TMDb' do
    before do
      @fake_results = [double('movie1'), double('movie2')]
    end

    it 'calls the model method that performs TMDb search' do
      expect(Movie).to receive(:find_in_tmdb).with('hardware').and_return(@fake_results)
      get :search_tmdb, params: { search_terms: 'hardware' }
    end

    describe 'after valid search' do
      before do
        allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)
        get :search_tmdb, params: { search_terms: 'hardware' }
      end

      it 'selects the Search Results template for rendering' do
        expect(response).to render_template('search_tmdb')
      end

      it 'makes the TMDb search results available to that template' do
        expect(assigns(:movies)).to eq(@fake_results)
      end
    end
  end

  describe 'adding a TMDb movie' do
    it 'saves the movie and returns to search' do
      movie = { title: 'Manhunter', rating: 'R', description: 'A thriller', release_date: '1986-08-15' }

      expect { post :add_movie, params: { movie: movie } }.to change(Movie, :count).by(1)
      expect(response).to redirect_to(search_tmdb_path)
      expect(flash[:success]).to eq('Manhunter was successfully added to RottenPotatoes.')
    end
  end
end
