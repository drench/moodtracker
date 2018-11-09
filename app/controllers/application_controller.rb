class ApplicationController < ActionController::Base
protect_from_forgery with: :null_session
  
  def current_user
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
                                   token, 
                                   Rails.application.credentials.fetch(:secret_key_base), 
                                   { algorithm: 'HS256' }
                                   )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end
  
  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_family
     unless current_user.family_id && user_id.fammily_id
      render json: {}, status: :unauthorized
    end
  end

  def award
    grant_on 'proud_messages#create',  badge: 'Jr.Contributor', to: :user do |proud_message|
      proud_message.user.proud_messages.count >= 10 &&  proud_message.proud_messages.comments.count < 50
    end
    grant_on 'proud_messages#create',  badge: 'Sr.Contributor', to: :user do |proud_message|
      proud_message.user.proud_messages.count >= 50
    end
    grant_on 'comments#create',  badge: 'Jr.Critic', to: :user do |comment|
      comment.user.comments.count >= 10 &&  comment.user.comments.count < 50
    end
    grant_on 'comments#create',  badge: 'Sr.Critic', to: :user do |comment|
      comment.user.comments.count >= 50
    end
  end

end
