class InvitationMailerQueue
  include Sidekiq::Worker

  def perform(invitation_id)
    invitation = Invitation.find(invitation_id)
    CiMailer.invitation(invitation).deliver
  end
end
