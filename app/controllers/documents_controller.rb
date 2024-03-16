class DocumentsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @document = Document.new
  end

  def index
    @user = current_user
    @users = User.all
    @projects = Project.all
    @docs_all = Document.all
    @documents = []
    @documents_all.each do |doc|
      if document.user_id == @user.id
        @documents << doc
      end
    end
  end

  def create
    puts "VOICI LE DOCUMENT CREE 1"
    tempfile = params[:file].tempfile
    name = params[:file].original_filename
    upload = Cloudinary::Uploader.upload(tempfile.path, folder: 'pdf_uploads')
    @upload_url = upload['secure_url']
    if ((name.include? ".jpg") || (name.include? ".jpeg") || (name.include? ".png"))
      doctype = "Photo"
    else
      doctype = "Document"
    end
    filename = name.split('.')[0]
    @document = Document.new(name: filename, type_of_document: doctype, url: upload['secure_url'])
    @project = Project.find(params[:project_id])
    @document.project_id = @project.id
    puts @document.project_id

    if @document.save
      puts ">>>>>>Document saved with succes"
    else
      puts ">>>>>>Document not saved"
    end
  end

  def show
    @project = Project.find(params[:id])
    @documents = @project.documents
  end

  private

  def document_params
    params.require(:document).permit(:name, :type_of_document, :url)
  end
end
