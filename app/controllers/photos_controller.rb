class PhotosController < ApplicationController
  include ActionController::Streaming
  include Zipline

  def index
    photos = Photo.all
    files = photos.map do |photo|
      [
        photo.image,
        photo.image.original_filename,
        modification_time: 1.day.ago
      ]
    end
    zipline(files, 'photos.zip')
  end
end
