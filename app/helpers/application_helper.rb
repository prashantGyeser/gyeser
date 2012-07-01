module ApplicationHelper

	# Return a title on every page
	base_title = "Urad Store"
	if @title.nil?
		base_title
	else
		"#{base_title} | #{@title}"
	end
end
