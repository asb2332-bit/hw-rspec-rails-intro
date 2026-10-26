class Movie < ActiveRecord::Base
  def self.find_in_tmdb(search_terms, api_key = ENV.fetch('TMDB_API_KEY', ''))
    terms = search_terms.with_indifferent_access
    query = { api_key: api_key, query: terms[:title] }
    query[:year] = terms[:release_year] if terms[:release_year].present?
    query[:language] = 'en-US' if terms[:language] == 'en'

    response = Faraday.get("https://api.themoviedb.org/3/search/movie?#{URI.encode_www_form(query)}")
    JSON.parse(response.body).fetch('results', []).map do |result|
      new(title: result['title'], rating: 'R', description: result['overview'], release_date: result['release_date'])
    end
  end

  def self.all_ratings
    %w[G PG PG-13 R]
  end

  def self.with_ratings(ratings, sort_by)
    if ratings.nil?
      all.order sort_by
    else
      where(rating: ratings.map(&:upcase)).order sort_by
    end
  end
end
