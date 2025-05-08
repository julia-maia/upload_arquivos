class RecordsController < ApplicationController
  def index
    page = params[:page].to_i
    page = 1 if page < 1
    per_page = 1
    offset = (page - 1) * per_page

    @records = Record.limit(per_page).offset(offset)
    total_records = Record.count
    @total_pages = (total_records.to_f / per_page).ceil
    @current_page = page
  end
end
