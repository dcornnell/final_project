class User < ActiveRecord::Base
 	has_many :posts
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
	
 	#search method
 	def self.search(params)
		user_name = params[:user_name]
		last_name = params[:last_name]
		search = User.all

		if user_name.present? 
			 search = search.where('user_name Like ?', "#{user_name}")
		end

		if last_name .present?
			search = search.where('last_name Like ?', "#{last_name}")
		end
	end


 

 


  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '50x50>',
    square: '200x200#',
    medium: '300x300>'
  }, :default_url => ActionController::Base.helpers.asset_path('default.png')

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
