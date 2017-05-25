class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :thumbnail do
    eager
    resize_to_fit(300, 300)
    cloudinary_transformation :quality => 80
  end

  version :small_thumb, from_version: :thumbnail do
    process resize_to_fill: [75, 75]
  end

end
