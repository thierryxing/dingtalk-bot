module DingBot
  module Message

    # markdown类型
    # {
    #     "msgtype": "markdown",
    #     "markdown": {
    #         "title":"杭州天气",
    #         "text": "#### 杭州天气\n" +
    #             "> 9度，西北风1级，空气良89，相对温度73%\n\n" +
    #             "> ![screenshot](http://image.jpg)\n"  +
    #             "> ###### 10点20分发布 [天气](http://www.thinkpage.cn/) \n"
    #     }
    # }
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