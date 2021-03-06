require './lib/user_service'
class MakersBNB < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  enable :sessions, :method_override  
  set :public_folder, File.expand_path('../../public', __FILE__)

  register Sinatra::Flash

  before do
    @user = UserService.current_user
  end

  get '/' do
    redirect('/accommodations')
  end

  run! if app_file == $0
end
