# DingTalk Bot
[![Build Status](https://travis-ci.org/thierryxing/dingtalk-bot.svg?branch=master)](https://travis-ci.org/thierryxing/dingtalk-bot)
[![Gem Version](https://badge.fury.io/rb/dingbot.svg)](https://rubygems.org/gems/dingbot)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/thierryxing/dingtalk-bot/master/LICENSE.txt)

DingTalk Bot是阿里钉钉自定义机器人的Ruby库  
官方文档：[阿里钉钉自定义机器人](https://open-doc.dingtalk.com/docs/doc.htm?spm=a219a.7629140.0.0.karFPe&treeId=257&articleId=105735&docType=1). 


## 安装
从rubygems中安装:

```sh
gem install dingbot
```

添加到Gemfile中:

```ruby
gem 'dingbot'
```

## 用法

初始化客户端:

```ruby
DingBot.configure do |config|
  config.endpoint = 'https://oapi.dingtalk.com/robot/send' # API endpoint URL, default: ENV['DINGTALK_API_ENDPOINT'] or https://oapi.dingtalk.com/robot/send
  config.access_token = '3ddef428f1478056e858450e07272834c79bd538e8055a04e989573c469xxxx' # access token, default: ENV['DINGTALK_ACCESS_TOKEN']
end
```

发送消息
```ruby
# 快速发送一套只包含文本的Text消息（不需要构造Message对象）
def send_simple_text
  DingBot.send_text('我就是我, 是不一样的烟火')
end

# 发送复杂Text消息
def send_text
  message = DingBot::Message::Text.new(
      '我就是我, 是不一样的烟火',
      ['13718896117'],
      false
  )
  DingBot.send_msg(message)
end

# 发送Link消息
def send_link
  message = DingBot::Message::Link.new(
      '我就是我, 是不一样的烟火',
      '这个即将发布的新版本，创始人陈航（花名“无招”）称它为“红树林”。',
      'https://mp.weixin.qq.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI',
      'https://avatars1.githubusercontent.com/u/64818'
  )
  DingBot.send_msg(message)
end

# 发送Markdown消息
def send_markdown
  DingBot.send_markdown('我就是我, 是不一样的烟火', '### 我就是我, 是不一样的烟火')
end

# 发送整体跳转ActionCard消息
def send_whole_action_card
  message = DingBot::Message::WholeActionCard.new(
      '乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
      '![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅',
      '阅读全文',
      'https://www.dingtalk.com/'
  )
  DingBot.send_msg(message)
end

# 发送独立跳转ActionCard类型消息
def send_independent_action_card
  message = DingBot::Message::IndependentActionCard.new(
      '乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
      '![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅',
      [
          DingBot::Message::ActionBtn.new('内容不错', 'https://www.dingtalk.com/'),
          DingBot::Message::ActionBtn.new('不感兴趣', 'https://www.dingtalk.com/')
      ]
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
```
更为详细的用法请见此链接：[https://github.com/thierryxing/dingtalk-bot/blob/master/test/dingbot_test.rb](https://github.com/thierryxing/dingtalk-bot/blob/master/test/dingbot_test.rb)

## License
Released under the MIT license. See LICENSE.txt for details.