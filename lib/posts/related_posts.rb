#encoding: utf-8
module Posts
  class RelatedPosts

    # Public: Helper to initialize and find
    #
    # see #find for more
    #
    # returns true
    def self.find(post)
      related = self.new(post)
      related.find
    end

    # Public: Initializes an RelatedPosts
    #
    # post = Post instance
    #
    # returns self
    def initialize(post)
      raise ArgumentError unless post.is_a?(Post)
      @post = post
    end

    # Public: Find at most 3 different posts
    # from the same location (province)
    #
    # returns array
    def find
      shuffle_and_take_3_relateds
    end

    private

    def all_relateds
      Post.tagged_with(@post.tag_list).where('active = ?', true)
    end

    def remove_itself_from_relateds
      all_relateds.to_a.delete_if { |post| @post == post }
    end

    def shuffle_and_take_3_relateds
      remove_itself_from_relateds.shuffle.take(3)
    end

  end
end
