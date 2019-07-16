require 'open-uri'

class PhotosController < ApplicationController
  include ActionController::Streaming
  include Zipline

  def index
    image_urls = %w[
      https://upload.wikimedia.org/wikipedia/commons/4/4c/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary_%28False_Color%29.jpg
      https://upload.wikimedia.org/wikipedia/commons/f/f0/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary_%28Stereo%29.jpg
      https://upload.wikimedia.org/wikipedia/commons/1/16/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary.jpg
    ]

    files = image_urls.map.with_index do |image_url, index|
      [
        image_url,
        "#{index}.jpeg",
        modification_time: index.days.ago
      ]
    end

    zipline(files, 'photos.zip')
  end
end
