class User < ActiveRecord::Base

	def self.filter(first_name, last_name, city, gender, technology)
		user = User.all
		user = user.where(['first_name LIKE ? AND last_name LIKE ? AND city LIKE ?  AND gender LIKE ? AND technology LIKE ?', "%#{first_name}%", "%#{last_name}%", "%#{city}%", "%#{gender}%", "%#{technology}%"])
		return user
	end

end
