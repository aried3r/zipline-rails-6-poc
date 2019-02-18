require 'down'

desc 'Download some big images from Wikipedia'
task download_images: :environment do
  image_urls = %w[
    https://upload.wikimedia.org/wikipedia/commons/4/4c/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary_%28False_Color%29.jpg
    https://upload.wikimedia.org/wikipedia/commons/f/f0/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary_%28Stereo%29.jpg
    https://upload.wikimedia.org/wikipedia/commons/1/16/%27Matijevic_Hill%27_Panorama_for_Rover%27s_Ninth_Anniversary.jpg
  ]

  image_urls.each do |image_url|
    photo = Photo.new
    photo.image = Down.download(image_url)
    photo.save
  end
end
