namespace :shigotodoko do
  desc "Expires posts older than 1 month"
  task expire_old_posts: :environment do
    published_posts = Post.published

    published_posts.each do |p|
      if p.published_at < 1.month.ago
        post = Post.find(p.id)
        post.expire!

        Mailer.expired(post).deliver_now
      end
    end
  end

  desc "Tweets a random published post"
  task tweet: :environment do
    uri = URI("http://jobboto.herokuapp.com")
    Net::HTTP.get(uri)
    Rails.logger.info("[Tweetbot] Tweet published.")
  end
end
