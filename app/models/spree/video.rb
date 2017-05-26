module Spree
  class Video < ActiveRecord::Base
    belongs_to :watchable, :polymorphic => true, :touch => true
    acts_as_list scope: [:watchable_id, :watchable_type]

    validates_presence_of :youtube_ref
    validates_uniqueness_of :youtube_ref, :scope => [:watchable_id, :watchable_type]

    def youtube_data
      Yt::Video.new id: youtube_ref
    end

    def embed_html
      youtube_data.embed_html.gsub(/#{youtube_ref}/, "#{youtube_ref}?autoplay=0&showinfo=0&controls=1&loop=1&playlist=#{youtube_ref}")
    end
  
    after_validation do
      youtube_ref.match(/(v=|\/)([\w-]+)(&.+)?$/) { |m| self.youtube_ref = m[2] }
    end
  end
end
