class Micropost < ActiveRecord::Base
  belongs_to :product
  # sort comment DES
  default_scope -> { order(created_at: :desc) }
  # for impage upload
  mount_uploader :picture, PictureUploader  #for future work - allowing user to also upload images to their comments
  validates :product_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
end
