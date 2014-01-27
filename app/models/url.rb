class Url < ActiveRecord::Base

	def count
		self.increment!(:views, by = 1)
	end
end
