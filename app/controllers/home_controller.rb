require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController



  def index
  end
  def rate
    @courses = Course.all      
    end


  end
  def mypage
  end
end


