require 'open-uri'

get '/sepia/' do
  return status 400 unless params[:url]
  imgurl=params[:url]

  basename = File.basename(imgurl)

  img = open(imgurl).read
  attachment basename

  image = MiniMagick::Image.open(imgurl)
  image.combine_options do |c| c.sepia_tone "93%" end
  image.to_blob

end
