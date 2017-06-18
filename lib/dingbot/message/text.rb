module DingBot
  module Message

    # text类型
    # {
    #     "msgtype": "text",
    #     "text": {
    #         "content": "我就是我, 是不一样的烟火"
    #     },
    #     "at": {
    #         "atMobiles": [
    #             "156xxxx8827",
    #             "189xxxx8325"
    #         ],
    #         "isAtAll": false
    #     }
    # }
    class Text < Base
      attr_accessor :content, :at_mobiles, :is_at_all

      def initialize(content='', at_mobiles=[], is_at_all=false)
        @content = content
        @at_mobiles = at_mobiles
        @is_at_all = is_at_all
      end

      def msg_type
        TYPE::TEXT
      end

      def body_params
        super.merge({
                        text: {
                            "content": @content
                        },
                        at: {
                            atMobiles: @at_mobiles,
                            isAtAll: @is_at_all
                        }
                    })
      end
    end

  end
end