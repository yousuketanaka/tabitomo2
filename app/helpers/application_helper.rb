# 詳しくは、https://qiita.com/100010/items/d894929de35403fd8479
module ApplicationHelper
	def controller?(controller)
		controller.include?(params[:controller])
	end

	def action?(action)
		action.include?(params[:action])
	end
end
