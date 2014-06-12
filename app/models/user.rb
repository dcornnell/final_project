class User < ActiveRecord::Base
 
 has_many :friendships
 has_many :friends, :through => :friendships
 belongs_to :role
 has_many :attempts
 has_many :comments
 has_many :ratings
 has_secure_password
 validates_presence_of :email
 validates_presence_of :user_name
 validates_uniqueness_of :email
 validates_uniqueness_of :user_name
 
 Paperclip.options[:command_path] = "/usr/local/bin/"


 has_attached_file :avater, styles: {
 		
 		thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  
  }

 


  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
