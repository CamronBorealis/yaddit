class SampleUserJack
	def initialize plug = nil
		case plug
		when :pg
			@plug = nil
		when nil
			@plug = nil
		end
	end

	def create input
		if @plug = nil
			nil
		else
			nil
		end
	end

	def get_by_email email
		{:id=>1, :email=>"test@test.com", :first_name=>"Camron", :last_name=>"Bute", :password_hash=>"$2a$10$pHl5Gax4WCfG3E5yV/peZ.K89/YnoigilwQzLmNQI8ycnCWPw1esa", :password_salt=>"$2a$10$pHl5Gax4WCfG3E5yV/peZ."}
	end
end