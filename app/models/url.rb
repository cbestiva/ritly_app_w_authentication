# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null, primary key
#  link          :string(255)
#  random_string :string(255)
#  create_at     :string(255)
#  updated_at    :datetime
#  created_at    :datetime
#  views         :integer
#

class Url < ActiveRecord::Base

	def count
		self.increment!(:views, by = 1)
	end
end
