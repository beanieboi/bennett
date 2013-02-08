class Builder
  include Sidekiq::Worker
  sidekiq_options :queue => :bennett

  def perform(build_id)
    build = Build.find(build_id)
    if build.project.recentizer? && build.project.last_build != build
      build.skip!
    else
      build.build!
    end
  end

end
