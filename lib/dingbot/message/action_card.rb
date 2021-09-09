module DingBot
  module Message

    # ActionCard基类
    #   {
    #     "msgtype": "actionCard",
    #     "actionCard": {
    #       "title": "乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身",
    #       "text": "![screenshot](https://img.alicdn.com/tfs/TB1NwmBEL9TBuNjy1zbXXXpepXa-2400-1218.png) \n\n #### 乔布斯 20 年前想打造的苹果咖啡厅 \n\n Apple Store 的设计正从原来满满的科技感走向生活化，而其生活化的走向其实可以追溯到 20 年前苹果一个建立咖啡馆的计划", 
    #       "btnOrientation": "0",
    #       "btns": [
    #           {
    #               "title": "内容不错",
    #               "actionURL": "https://www.dingtalk.com/"
    #           },
    #           {
    #               "title": "不感兴趣",
    #               "actionURL": "https://www.dingtalk.com/"
    #           }
    #       ]
    #     }
    #     "at":{
    #        "atMobiles":["137188xxxxx"]
    #      }
    # }
    class ActionCard < Base
      attr_accessor :title, :text, :btn_orientation, :at_mobiles

      def initialize(title='', text='', btn_orientation='0', at_mobiles=[])
        @title = title
        @text = text
        @btn_orientation = btn_orientation
        @at_mobiles = at_mobiles
      end

      def msg_type
        TYPE::ACTION_CARD
      end

      def body_params
        super.merge({
            actionCard: {
                title: @title,
                text: @text,
                btnOrientation: @btn_orientation,
            },
            at: {
              atMobiles: @at_mobiles,
            }
          }
        )
      end
    end

    # 整体跳转ActionCard类型
    class WholeActionCard < ActionCard
      attr_accessor :single_title, :single_url

      def initialize(title='', text='', single_title='', single_url='', at_mobiles=[], btn_orientation='0')
        super(title, text, btn_orientation, at_mobiles)
        @single_title = single_title
        @single_url = single_url
      end

      def body_params
        action_card = super[:actionCard].merge(
            {
                singleTitle: @single_title,
                singleURL: @single_url
            }
        )
        super.merge(actionCard: action_card)
      end
    end

    # 独立跳转ActionCard类型
    class IndependentActionCard < ActionCard
      attr_accessor :buttons

      def initialize(title='', text='', buttons=[], at_mobiles=[], btn_orientation='0')
        super(title, text, btn_orientation, at_mobiles)
        @buttons = buttons
      end

      def body_params
        action_card = super[:actionCard].merge(btns: @buttons.map {|btn| btn.format})
        super.merge(actionCard: action_card)
      end
    end

    # 跳转按钮
    class ActionBtn
      attr_accessor :title, :action_url

      def initialize(title='', action_url='')
        @title = title
        @action_url = action_url
      end

      def format
        {
            title: @title,
            actionURL: @action_url
        }
      end
    end

  end
end