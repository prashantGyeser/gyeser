module ApplicationHelper

	# Return a title on every page
	base_title = "Gyeser | Online food ordering simplified"
	if @title.nil?
		base_title
	else
		"#{base_title} | #{@title}"
	end
end
