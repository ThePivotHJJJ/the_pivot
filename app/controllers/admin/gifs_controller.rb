class Admin::GifsController < Admin::BaseController
  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      tags = params[:tags].split(", ")
      @gif.create_tags(tags)
      flash[:success] = "Gif has been successfully added"
      redirect_to gif_path(@gif)
    else
      flash.now[:error] = "Invalid Entry, Try again."
      render new_admin_gif_path
    end
  end

  def edit
    @gif = find_gif
  end

  def update
    @gif = find_gif
    if @gif.update(gif_params)
      if params[:tags]
        tags = params[:tags].split(", ")
        @gif.create_tags(tags)
      end
      redirect_to gif_path(@gif.id)
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end

  def destroy
    @gif = find_gif
    @gif.destroy
    flash[:success] = "This gif was successfully deleted."
    redirect_to root_url
  end

private

  def gif_params
    params.require(:gif).permit(:title, :description, :price, :tag, :image, :retired)
  end

  def redirect_to_back(default = root_url)
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end
end
