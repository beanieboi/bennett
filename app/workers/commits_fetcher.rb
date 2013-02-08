class CommitsFetcher
  include Sidekiq::Worker
  sidekiq_options :queue => :bennett

  def perform(build_id)
    build = Build.find(build_id)
    build.fetch_commit!
    Builder.perform_async(build_id)
  end
end
