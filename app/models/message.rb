class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  after_create_commit {broadcast_append_to self.room}
  before_create :confirm_participant

  def confirm_participant
    return unless room.is_private 
      is_participant = Participant.where(user_id: user.id, room_id: room.id).first
      throw :abort unless is_participant
  end
end