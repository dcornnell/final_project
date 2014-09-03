class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 	has_many :posts
	has_many :friendships
	has_many :friends, :through => :friendships
	belongs_to :role
	has_many :attempts
	has_many :comments
	has_many :ratings
	
	validates_presence_of :email
	validates_presence_of :user_name
	validates_uniqueness_of :email
	validates_uniqueness_of :user_name

	Paperclip.options[:command_path] = "/usr/local/bin/"
	
 	#search method
 	def self.search(params)
		user_name = params[:user_name]
    user_friend = params[:friend]
		search = User.all

		if user_name.present?
			 search = search.where('user_name Like ?', "#{user_name}")
		end

  
	end

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '50x50>',
    square: '200x200#',
    medium: '300x300>'
  }, :default_url => "default.png"


  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  #pull in info from facebook
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
   	 	user.provider = auth.provider
    	user.uid = auth.uid
    	if auth.info.nickname
    		user.user_name = auth.info.nickname
    	else
    		user.user_name = "#{auth.info.first_name}#{auth.info.last_name}"
    	end
    	user.first_name = auth.info.first_name
    	user.last_name = auth.info.last_name
    	user.facebook_image = auth.info.image
    	user.oauth_token = auth.credentials.token
    	user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    	if auth.extra.email
    		user.email = auth.extra.email
    	else
    		user.email = "email@example.com"
    	end
    	user.password = auth.info.last_name
    	user.save!
  	end
	end

end
