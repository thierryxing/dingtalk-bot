module DingBot
  module Message

    # FeedCard类型
    class FeedCard < Base
      attr_accessor :links

      def initialize(links=[])
        @links = links
      end

      def msg_type
        TYPE::FEED_CARD
      end

      def body_params
        super.merge(feedCard: {
            links: @links.map {|link| link.format}
        })
      end
    end

    # FeedCard跳转链接
    class FeedCardLink
      attr_accessor :title, :pic_url, :message_url

      def initialize(title='', pic_url='', message_url='')
        @title = title
        @pic_url = pic_url
        @message_url = message_url
      end

      def format
        {
            title: @title,
            messageURL: @message_url,
            picURL: @pic_url
        }
      end
    end

  end
end