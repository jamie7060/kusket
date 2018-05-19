class ApplicationController < ActionController::Base
 # protect_from_forgery with: :exception
 
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :grade])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :grade])
  end
 
 def after_sign_in_path_for(user)
  "http://localhost:3000/home/index"
end

  def crawl
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


end
