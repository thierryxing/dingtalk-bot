module DingBot
  module Message

    class Markdown < Base
      attr_accessor :title, :text

      def initialize(title='', text='')
        @title = title
        @text = text
      end

      def msg_type
        TYPE::MARKDOWN
      end

      def body_params
        super.merge(markdown: {
            text: @text,
            title: @title,
        })
      end
    end

  end
end