class ImportsController < ApplicationController
  def new
  end

  def create
    file = params[:file]

    if file.nil?
      redirect_to new_import_path, alert: "Nenhum arquivo selecionado."
      return
    end

    if file.content_type != "application/octet-stream"
      redirect_to new_import_path, alert: "Somente arquivos .tab e .csv são aceitos."
      return
    end

    begin
      result = TabFileImporter.call(file, current_user.id)
      redirect_to purchases_path, notice: "Importação concluída. Receita total: R$ #{'%.2f' % result}"
    rescue => e
      logger.error "Erro ao importar TAB: #{e.class} - #{e.message}"
      redirect_to new_import_path, alert: "Erro na leitura do arquivo. Certifique-se de que está salvo em UTF-8 e no formato correto."
    end
  end
end