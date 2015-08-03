class Product < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
	default_scope -> { order(created_at: :desc) }
	validates :name, presence: true
  	validates :price, presence: true, numericality: true
  	validates :picture, presence: true
  	mount_uploader :picture, PictureUploader #handle image uploading
  	validate  :picture_size

  	private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
