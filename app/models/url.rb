class Url < ActiveRecord::Base

	def count
		self.increment!(:views)
	end
end
