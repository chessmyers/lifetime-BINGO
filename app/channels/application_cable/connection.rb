module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_player

    def connect
      self.current_player = find_player
    end

    private

    def find_player
      if verified_user = Player.find_by(id: cookies[:player_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
