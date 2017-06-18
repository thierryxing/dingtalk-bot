module DingBot
  module Message

    class Link < Base
      attr_accessor :title, :text, :pic_url, :message_url

      def initialize(title='', text='', pic_url='', message_url='')
        @title = title
        @text = text
        @pic_url = pic_url
        @message_url = message_url
      end

      def msg_type
        TYPE::LINK
      end

      def body_params
        super.merge(link: {
            text: @text,
            title: @title,
            picUrl: @pic_url,
            messageUrl: @message_url
        })
      end
    end

  end
end