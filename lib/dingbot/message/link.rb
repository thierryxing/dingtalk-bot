module DingBot
  module Message
    # link类型
    # {
    #         "msgtype": "link",
    #         "link": {
    #             "text": "这个即将发布的新版本，创始人陈航（花名“无招”）称它为“红树林”。
    # 而在此之前，每当面临重大升级，产品经理们都会取一个应景的代号，这一次，为什么是“红树林”？",
    #             "title": "时代的火车向前开",
    #             "picUrl": "",
    #             "messageUrl": "https://mp.weixin.qq.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI"
    #         }
    #     }
    class Link < Base
      attr_accessor :title, :text, :pic_url, :message_url

      def initialize(title='', text='', message_url='', pic_url='')
        @title = title
        @text = text
        @message_url = message_url
        @pic_url = pic_url
      end

      def msg_type
        TYPE::LINK
      end

      def body_params
        super.merge(
            link: {
                text: @text,
                title: @title,
                picUrl: @pic_url,
                messageUrl: @message_url
            }
        )
      end
    end

  end
end