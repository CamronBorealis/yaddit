require 'validation'

class Message
  include Validation

  attr_validator :id, Fixnum
  attr_validator :title, AND(OR(String, nil), NOT(""))
  attr_validator :body, String
  attr_validator :user_id, Fixnum
  attr_validator :reply_to_message_id, OR(nil, Integer)
  attr_validator :root_message_id, OR(nil, Integer)
  
  def self.shape
    {
    	:id => Fixnum,
  		:title => AND(OR(String, nil), NOT("")),
  		:body => String,
  		:user_id => Fixnum,
  		:reply_to_message_id => OR(nil, Integer),
      :root_message_id =>  OR(nil, Integer),
    }
  end
  
  def populate input
    self.id = input[:id]
    self.title = input[:title]
    self.body = input[:body]
    self.user_id = input[:user_id]
    self.reply_to_message_id = input[:reply_to_message_id]
    self.root_message_id = input[:root_message_id]
  end
    
  def to_hash
    {
    	:id => id,
  		:title => title,
  		:body => body,
  		:user_id => user_id,
  		:reply_to_message_id => reply_to_message_id,
      :root_message_id => root_message_id
    }
  end
    
end
