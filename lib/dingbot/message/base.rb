require 'json'
module DingBot
  module Message

    module TYPE
      TEXT = 'text'
      LINK = 'link'
      MARKDOWN = 'markdown'
      ACTION_CARD = 'actionCard'
      FEED_CARD = 'feedCard'
    end

    # Base Message
    class Base

      def msg_type
        # implement inside child
      end

      def body_params
        {
            msgtype: msg_type
        }
      end

      # Set http post body as json string
      def to_json
        body_params.to_json
      end

    end
  end
end