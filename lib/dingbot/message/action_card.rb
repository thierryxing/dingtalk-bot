module DingBot
  module Message

    # ActionCard基类
    class ActionCard < Base
      attr_accessor :title, :text, :btn_orientation, :hide_avatar

      def initialize(title='', text='', btn_orientation='0', hide_avatar='0')
        @title = title
        @text = text
        @btn_orientation = btn_orientation
        @hide_avatar = hide_avatar
      end

      def msg_type
        TYPE::ACTION_CARD
      end

      def body_params
        super.merge(
            actionCard: {
                title: @title,
                text: @text,
                "hideAvatar": @hide_avatar,
                "btnOrientation": @btn_orientation,
            }
        )
      end
    end

    # 整体跳转ActionCard类型
    class WholeActionCard < ActionCard
      attr_accessor :single_title, :single_url

      def initialize(title='', text='', btn_orientation='0', hide_avatar='0', single_title='', single_url='')
        super(title, text, btn_orientation, hide_avatar)
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

      def initialize(title='', text='', btn_orientation='0', hide_avatar='0', buttons=[])
        super(title, text, btn_orientation, hide_avatar)
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