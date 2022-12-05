class ReportController < ApplicationController
  def index
    @movies = Movie.all
  end

  def points
    @points = Point.all
  end
end
