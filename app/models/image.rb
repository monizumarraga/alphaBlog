class Image < ApplicationRecord
    belongs_to :user
    mount_uploader :picture, PictureUploader
    validate :picture_size
    before_save :upload_to_s3

    private
    
    def picture_size
        if picture.size > 5.megabytes
            errors.add(:picture, "should be less than 5MB")
        end
    end
    
    def upload_to_s3
        s3 = Aws::S3::Resource.new(region:'us-west-2')
        obj = s3.bucket('alphablogimages').object('key')
        obj.upload_file('/path/to/source/file')
    end
end
