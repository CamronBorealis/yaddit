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
end