class PostsController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 10).decorate
  end

  def show
    @post = Post.find(params[:id]).decorate
  end

  def new
    @post = Post.new(active: false)
  end

  def create
    @post = new_post(post_params)

    if @post.save_for_web
      Mailer.notify(params[:post]).deliver_now
      redirect_to post_success_path
    else
      flash.now[:error] = 'Não foi possível enviar seu anúncio.'
      render :new
    end
  end

  def success
  end

  protected

  def post_params
    params.require(:post).permit(:title, :description, :location, :salary, :shift, :work_load, :day_off, :requirements,
                                :benefits, :contractor_person_name, :contractor_company_name, :contractor_address,
                                :contractor_mail_address, :contractor_phone_number)
  end

  def new_post(post_params)
    Post.new(post_params).tap do |post|
      post.notes = ContractorParser.call(post_params)
      post.contractor = Contractor.new
    end
  end
end
