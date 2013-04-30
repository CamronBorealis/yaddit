require 'validation'

class Message
	include Validation

	attr_validator :title, NOT("")
end