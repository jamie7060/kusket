require 'rubygems'
require 'nokogiri'
require 'open-uri'

class HomeController < ApplicationController



  def index
  end
  def rate


    
    page = Nokogiri::HTML(open("http://sugang.korea.ac.kr/lecture/LecMajorSub.jsp?lang=KOR&yy=2018&tm=1R&col=0140&dept=0142"),nil, 'EUC-KR')
    

    (1..32).each do |x|
      
      @course=Course.new
      @course.campus = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(1)").inner_text.strip
      @course.haksu = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(2)").inner_text.strip
      @course.bunban = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(3)").inner_text.strip
      @course.isu_type = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(4)").inner_text.strip
      @course.course_name = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(5)").inner_text.gsub!(/\s+/, '')
      @course.lecturer = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(6)").inner_text.strip
      @course.credit = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(7)").inner_text.strip
      @course.save

    end


  end
  def mypage
  end
end
