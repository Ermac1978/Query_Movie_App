class QueryMovieController < ApplicationController

  require 'net/http'
  require 'json'

  QUERY_URL = 'http://www.myapifilms.com/imdb'


  def query_movie

  end

  def search_results
    movie_title = params[:search]
    if movie_title.present?
      if params[:search_type] == "t"
        uri = URI(QUERY_URL + "?title=#{URI.escape(movie_title)}")
      else
        uri = URI(QUERY_URL + "?name=#{URI.escape(movie_title)}&filmography=1")
      end
      imdb_info_json = Net::HTTP.get(uri)
      imdb_info_ruby = JSON.parse(imdb_info_json)
      @imdb_info_var = imdb_info_ruby.first
    end
  end


end
