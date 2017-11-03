# 詳しくは、https://qiita.com/100010/items/d894929de35403fd8479
module ApplicationHelper
	def controller?(controller)
		controller.include?(params[:controller])
	end

	def action?(action)
		action.include?(params[:action])
	end

	def time_list
    [
      ['Period 1', '09:30'],
      ['Period 2', '10:30'],
      ['Period 2', '11:30'],
      ['Period 3', '13:45'],
      ['Period 4', '14:45'],
      ['Period 5', '15:45'],
      ['Period 6', '16:45'],
      ['Period 7', '17:45']
    ]

  end
end
