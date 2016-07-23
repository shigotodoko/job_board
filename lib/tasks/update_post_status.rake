namespace :shigotodoko do
  desc 'Set status to each post'
  task update_post_status: :environment do
    fail_publishing = []
    fail_expiring = []

    Post.find_each do |post|
      # verify if the post is published
      if post.published_at.present?

        if post.valid?
          post.published!
          post.save!
        else
          puts 'fail publishing'
          fail_publishing << post.id
        end
      end

      # verify if the post is expired
      if post.expired_at.present?

        if post.valid?
          post.expired!
          post.save!
        else
          puts 'fail expiring'
          fail_expiring << post.id
        end
      end

    end


    puts 'Summary:'
    puts '-----'
    puts "Fail publishing: #{fail_publishing.count}"
    puts '-----'
    puts fail_publishing.inspect

    puts '-----'
    puts "Fail expiring: #{fail_expiring.count}"
    puts '-----'
    puts fail_expiring.inspect
  end
end
