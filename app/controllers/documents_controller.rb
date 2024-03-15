class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def create
    tempfile = params[:file].tempfile
    upload = Cloudinary::Uploader.upload(tempfile.path, folder: 'pdf_uploads')
    # @upload_url = upload['secure_url']
    puts "PROJECT PARAMS"
    puts params[:id]
    doc = Document.new(project_id: params[:id], name: "Test", url: upload['secure_url'], type: "Facture")
    if doc.save!
      puts "Document saved with succes"
    else
      puts "Document not saved"
    end
    # render :new
  end

  private

  def project_params
    params.require(:project).permit(:id)
  end

end
