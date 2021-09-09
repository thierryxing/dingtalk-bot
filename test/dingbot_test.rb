require "bundler/setup"
require "dingbot"


DingBot.configure do |config|
  config.endpoint = 'https://oapi.dingtalk.com/robot/send' # API endpoint URL, default: ENV['DINGTALK_API_ENDPOINT'] or https://oapi.dingtalk.com/robot/send
  config.access_token = 'aa1e65bc850c2132d1581c0bb74cb8c0883e412d8a27ad2473dd3484xxxxxxxx' # access token, default: ENV['DINGTALK_ACCESS_TOKEN']
  config.secret = "SECda65697be17cda4fe6e00c402178a3e3b10b3c7c1af5c076dfda0195xxxxxxxx" # sign secret
end

PHONE = '137188xxxxx'

# 快速发送一套只包含文本的Text消息（不需要构造Message对象）
def send_simple_text
  DingBot.send_text('我就是我, 是不一样的烟火')
end

# 发送复杂Text消息
def send_text
  message = DingBot::Message::Text.new(
      "我就是我, 是不一样的烟火 @#{PHONE}",
      [PHONE],
      false
  )
  DingBot.send_msg(message)
end

# 发送Link消息
def send_link
  message = DingBot::Message::Link.new(
      '我就是我, 是不一样的烟火',
      '这个即将发布的新版本，创始人陈航（花名“无招”）称它为“红树林”。',
      'https://www.dingtalk.com/',
      'https://avatars1.githubusercontent.com/u/64818'
  )
  DingBot.send_msg(message)
end

# 发送Markdown消息
def send_markdown
  DingBot.send_markdown('我就是我, 是不一样的烟火', '### 我就是我, 是不一样的烟火')
end

# 发送Markdown消息, 并 at 某人
def send_markdown_at_one
    message = DingBot::Message::Markdown.new(
        '我就是我, 是不一样的烟火', 
        "##### 我就是我, 是不一样的烟火  @#{PHONE}",
        [PHONE],
    )
    DingBot.send_msg(message)
end

# 发送Markdown消息, 并 at 全部
def send_markdown_at_all
  message = DingBot::Message::Markdown.new(
      '我就是我, 是不一样的烟火', 
      "##### 我就是我, 是不一样的烟火",
      [],
      true
  )
  DingBot.send_msg(message)
end

# 发送整体跳转ActionCard消息
def send_whole_action_card
  message = DingBot::Message::WholeActionCard.new(
      '乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
      "![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅",
      '阅读全文',
      'https://www.dingtalk.com/',
  )
  DingBot.send_msg(message)
end

# 发送独立跳转ActionCard类型消息，并 @ 某人
def send_independent_action_card_at_one
  message = DingBot::Message::IndependentActionCard.new(
      '乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
      "![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅 @#{PHONE}",
      [
          DingBot::Message::ActionBtn.new('内容不错', 'https://www.dingtalk.com/'),
          DingBot::Message::ActionBtn.new('不感兴趣', 'https://www.dingtalk.com/')
      ],
      [PHONE]
  )
  DingBot.send_msg(message)
end

# 发送FeedCard类型
def send_feed_card
  message = DingBot::Message::FeedCard.new(
      [
          DingBot::Message::FeedCardLink.new(
              '时代的火车向前开',
              'https://avatars1.githubusercontent.com/u/64818',
              'https://www.dingtalk.com/'
          ),
          DingBot::Message::FeedCardLink.new(
              '时代的火车向前开',
              'https://avatars1.githubusercontent.com/u/64818',
              'https://www.dingtalk.com/'
          )
      ]
  )
  DingBot.send_msg(message)
end

# send_text
# send_markdown_at_one
# send_whole_action_card
send_independent_action_card_at_one
# send_markdown_at_all