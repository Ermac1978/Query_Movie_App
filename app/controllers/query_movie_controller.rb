class QueryMovieController < ApplicationController

  require 'net/http'
  require 'json'

  QUERY_URL = 'http://www.myapifilms.com/imdb'


  def query_movie
    @search = params[:search] || cookies[:form_name]
    @search2 = params[:search_type] || cookies[:form_type]
  end

  def search_results
    cookies[:form_name] = params[:search] if params[:search]
    cookies[:form_type] = params[:search_type] if params[:search_type]
    movie_title = cookies[:form_name]
    if movie_title.present?
      if cookies[:form_type] == "title"
#logger.debug "*****************"
#logger.debug cookies[:form_type]
#logger.debug "******************"
        uri = URI(QUERY_URL + "?title=#{URI.escape(movie_title)}")
      else
        uri = URI(QUERY_URL + "?name=#{URI.escape(movie_title)}&filmography=1")
      end
      imdb_info_json = Net::HTTP.get(uri)
      imdb_info_ruby = JSON.parse(imdb_info_json)
      @imdb_info_var = imdb_info_ruby.first
    end
    @search = params[:search] || cookies[:form_name]
    @search2 = params[:search_type] || cookies[:form_type]
  end


end
