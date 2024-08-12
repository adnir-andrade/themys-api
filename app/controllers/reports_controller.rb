class ReportsController < ApplicationController
  before_action :set_sorter

  def generate_report(filename, data, headers, title)
    respond_to do |format|
      format.pdf do
        pdf = BasePdf.new(data: data, headers: headers, title: title)
        pdf.render_document
        send_data(pdf.render, filename: "#{filename}.pdf", type: 'application/pdf')
      end
    end
  end

  def set_sorter
    @sorter = params[:option]
  end
end