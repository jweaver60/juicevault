module ApplicationHelper

	def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
  end

  def featured_image(juice)
  	if juice.image_url.blank?
  		image_path("missingimage.png")
  	else
  		juice.image_url
  	end
  end

end
