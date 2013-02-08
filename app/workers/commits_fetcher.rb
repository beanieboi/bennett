class CommitsFetcher
  include Sidekiq::Worker

  def perform(build_id)
    build = Build.find(build_id)
    build.fetch_commit!
    Builder.perform_async(build_id)
  end
end
