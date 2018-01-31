class Message < ActiveRecord::Base
 belongs_to :conversation
 belongs_to :model
 validates_presence_of :body, :conversation_id, :model_id
 

end