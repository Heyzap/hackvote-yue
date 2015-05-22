module ApplicationHelper
  def full_title(page_title = '')
    base_title = ""
    if page_title.empty?
      base_title
    else
  	  page_title
    end
  end

  private

		def get_event
			@event = Event.find_by(id: params[:id])
		end

end
