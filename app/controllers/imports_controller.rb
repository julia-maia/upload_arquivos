class ImportsController < ApplicationController
  def new
  end

  def create
    file = params[:file]

    if file.nil?
      redirect_to root_path, alert: "Nenhum arquivo selecionado."
      return
    end

    result = TabFileImporter.call(file)


    redirect_to purchases_path, notice: "Importação concluída. Receita total: R$ #{'%.2f' % result}"
  end
end
