class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    @project = Project.find(params[:id])
    tempfile = params[:file].tempfile
    upload = Cloudinary::Uploader.upload(tempfile.path, folder: 'pdf_uploads')
    @upload_url = upload['secure_url']
    @document = Document.new(project_id: @project, name: "Test", type_of_document: "Photo", url: upload['secure_url'])
    puts "VOICI LE DOCUMENT CREE"
    puts @project
    puts @document.project_id
    if @document.save
      puts ">>>>>>Document saved with succes"
    else
      puts ">>>>>>Document not saved"
    end
    # render :new
  end

  def show
    @project = Project.find(params[:id])
    @documents = @project.documents
  end

  private

  def project_params
    params.require(:project).permit(:id)
  end

  def document_params
    params.require(:document).permit(:photo)
  end
end
