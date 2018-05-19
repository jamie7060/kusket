require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController
  def index
  end
  def rate
    page = Nokogiri::HTML(open("http://sugang.korea.ac.kr/index2.jsp"))
    elems = page.css('table .title a')

    elems.each {|item| puts item.text} 

  end
  def mypage
  end
end
