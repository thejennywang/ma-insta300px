class Post < ActiveRecord::Base
	belongs_to :user
  has_many :likes
  has_and_belongs_to_many :tags
  
  has_attached_file :picture, 
  styles: { medium: "350x350#"},
  :storage => :s3,
  :s3_credentials => {
    :bucket => 'theinstragram',
    :access_key_id => Rails.application.secrets.s3_access_key_id,
    :secret_access_key => Rails.application.secrets.s3_secret_access_key
  }

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  validates :user_id, presence: true
  validates :title, presence: {message: "You must add a title"}
  validates :picture, presence: {message: "You must add a picture"}
  validates :price, presence: true, numericality: true

	def tag_list
	end

	def tag_list=(some_tags)
		return if some_tags.empty?

		some_tags.split(", ").uniq.each do |tag|  	
			self.tags << Tag.find_or_create_by(text: tag)
		end
	end
end
