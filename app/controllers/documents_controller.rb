class DocumentsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @document = Document.new
  end

  def index
    @project = Project.find(params[:project_id])
    @documents = @project.documents
    doc_filtered = []
    @documents.each do |doc|
      tag_found = 1
      params[:active_tags].split(",").each do |tag|
        if doc.tag_list.include?(tag)
          tag_found = tag_found * 1
        else
          tag_found = tag_found * 0
        end
      end
      if tag_found != 0
        doc_filtered << doc
      end
    end

    if params[:active_tags].empty?
      @documents = @project.documents
    else
      @documents = doc_filtered
    end
    #@documents = @documents.where("tag_list ILIKE ?", "%#{params[:active_tags]}%") if params[:active_tags].present?
    #@documents = @documents.where("tags ILIKE ?", "%#{params[:active_tags]}%") if params[:active_tags].include?(doc.tags)
    render json: { documents: render_to_string(partial: "document", formats: [:html])}
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

  def update
    @document = Document.find(params[:id])
    @project = @document.project

    tag_list = params[:tags].split(",")
    @project_tags = @project.project_tags
    @project_tags << tag_list
    @project_tags = @project_tags.uniq

    @document.tag_list.add(tag_list)

    @document.save
    redirect_to document_path(@document)
  end

  private

  def document_params
    params.require(:document).permit(:name, :type_of_document, :url, :id, :tags)
  end
end
