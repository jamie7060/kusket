class HomeController < ApplicationController

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  def index
  end
  def crawl
    page = Nokogiri::HTML(open("http://sugang.korea.ac.kr/lecture/LecMajorSub.jsp?lang=KOR&yy=2018&tm=1R&col=0140&dept=0142"),nil, 'EUC-KR')
    
    course_arr =[]
    


    for x in (1..138)
      
     
      campus = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(1)").inner_text.strip
      haksu = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(2)").inner_text.strip
      bunban = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(3)").inner_text.strip
      isu_type = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(4)").inner_text.strip
      course_name = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(5)").inner_text.strip
      lecturer = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(6)").inner_text.strip
      credit = page.css(".page//table//tr:nth-child(#{x})//td:nth-child(7)").inner_text.strip

      a=Hash.new
      a["campus"] = "#{campus}"
      a["haksu"] = "#{haksu}"
      a["bunban"] = "#{bunban}"
      a["isu_type"] = "#{isu_type}"
      a["course_name"] = "#{course_name}"
      a["lecturer"] = "#{lecturer}"
      a["credit"] = "#{credit}"
      course_arr<<a
    end


    
      # course_arr[x].each do |key, value|
      #   t = Course.new
      #   t.campus = a["#{key}"]
      #   t.haksu = a["#{key}"]
      #   t.bunban = a["#{key}"]
      #   t.isu_type = a["#{key}"]
      #   t.course_name = a["#{key}"]
      #   t.lecturer = a["#{key}"]
      #   t.credit = a["#{key}"]
        
        # t.save
      # @post=Post.new
      # @post.title=___
      # @post.content=___
      # @post.save

      # Post.create(title:___, content:____)
    course_arr.each do |x|
      Gwamok.create(campus:x["campus"],
        haksu:x["haksu"],
        bunban:x["bunban"],
        isu_type:x["isu_type"],
        course_name:x["course_name"],
        lecturer:x["lecturer"],
        credit:x["credit"],
        rate: 0
        )
      end

  
  end

  def rate
    @courses = Gwamok.all      
  end


  def mypage
    @courses = Gwamok.all
  end

  def submit
    courses = Gwamok.all 
    x=0
    courses.each do |course|
    x+=1
    if params[:"rate#{x}"]
    course.rate+=1
    course.save
    end
  end
    redirect_to '/home/mypage'
    # Current_user.sel1="#{x}"
  
  end
end


