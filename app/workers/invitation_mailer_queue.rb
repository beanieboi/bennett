class InvitationMailerQueue
  include Sidekiq::Worker
  sidekiq_options :queue => :bennett

  def perform(invitation_id)
    invitation = Invitation.find(invitation_id)
    CiMailer.invitation(invitation).deliver
  end
end
