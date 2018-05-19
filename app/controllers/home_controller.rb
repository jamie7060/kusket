require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController



  def index
  end
  def crawl
    page = Nokogiri::HTML(open("http://sugang.korea.ac.kr/lecture/LecMajorSub.jsp?lang=KOR&yy=2018&tm=1R&col=0140&dept=0142"),nil, 'EUC-KR')
    
    course_arr =[]
    


    (1..32).each do |x|
      
      a=Hash.new
      a["campus"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(1)").inner_text.strip
      a["haksu"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(2)").inner_text.strip
      a["bunban"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(3)").inner_text.strip
      a["isu_type"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(4)").inner_text.strip
      a["course_name"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(5)").inner_text.gsub!(/\s+/, '')
      a["lecturer"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(6)").inner_text.strip
      a["course.credit"] = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(7)").inner_text.strip

      course_arr<<a
    end


    (0..1).each do |x|
      course_arr["#{x}"].each do |key, value|
        t = Course.new
        t.campus = a["#{key}"]
        t.save
      end
    end

    


    redirect_to '/'
  end

  def rate
    @courses = Course.all      
  end


  def mypage
  end
end


