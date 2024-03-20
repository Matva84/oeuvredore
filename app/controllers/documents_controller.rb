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
    tempfile = params[:file].tempfile
    name = params[:file].original_filename
    if ((name.include? ".jpg") || (name.include? ".jpeg") || (name.include? ".png") || (name.include? ".gif"))
      doctype = "photo"
      upload = Cloudinary::Uploader.upload(tempfile.path, folder: 'development')
    else
      doctype = "document"
      upload = Cloudinary::Uploader.upload(tempfile.path, folder: 'development')
    end
    @upload_url = upload['secure_url']
    public_id = upload['public_id'].split("/")[1]
    filename = name.split('.')[0]
    project_id = params[:id].to_i

    @document = Document.new(project_id: project_id, name: filename, type_of_document: doctype, url: upload['secure_url'], cloudinary_id: public_id)
    @document.tag_list.add(doctype)

    @document.save!
    redirect_to document_path(@document)
  end

  def show
    @project = Project.find(params[:id])
    @documents = @project.documents
    @document = Document.find(params[:id])
    @tags = @document.tag_list
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to document_path(@document), see: :others
  end

  def add_tags
    @document = Document.find(params[:id])
    @document.tag_list.add(params[:tag_list])
    @document.save
    raise
    redirect_to document_path(@document)
  end

  private

  def document_params
    #params.require(:document).permit(:name, :type_of_document, :url, :id, :tag_list)
    params.require(:document).permit(:name, :type_of_document, :url, :id)
  end
end
