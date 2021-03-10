module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_player

    def connect
      Rails.logger.debug('whatup')
      self.current_player = find_verified_player
      Rails.logger.debug('we are actually here')
    end

    private
    def find_verified_player
      puts cookies.encrypted
      puts '***********************************'
      puts cookies
      puts session[:player_id]
      if verified_player = Player.find_by(id: cookies.encrypted['_session']['player_id'])
        verified_player
      else
        reject_unauthorized_connection
      end
    end
  end
end
