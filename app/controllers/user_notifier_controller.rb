class UserNotifierController < ApplicationController
  skip_before_action :authorize
  skip_before_action :authorize_user
  skip_before_action :authorize_cart_user

  skip_before_action :protect_from_forgery
  protect_from_forgery with: :null_session

  def mail_it
    logger.info "mail_it called with #{params}"
    @email = params[:email]
    #this only works for the welcome email. Probably need to write another method for lost_password
    UserNotifier.mail_it(@email, 'original text').deliver
    render text: 'mail sent'
  end

  def bounce
    json = JSON.parse(request.raw_post)
    logger.info "bounce callback from AWS with #{json}"
    aws_needs_url_confirmed = json['SubscribeURL']
    if aws_needs_url_confirmed
      logger.info "AWS is requesting confirmation of the bounce handler URL"
      uri = URI.parse(aws_needs_url_confirmed)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.get(uri.request_uri)
    else
      logger.info "AWS has sent us the following bounce notifications(s): #{json}"
      UserNotifier.mail_it('cs106607@ohio.edu', json).deliver
      json['bounce']['bouncedRecipients'].each do |recipient|
        logger.info "AWS SES received a bounce on an email send attempt to #{recipient['emailAddress']}"
      end
    end
    render nothing: true, status: 200
  end

end
