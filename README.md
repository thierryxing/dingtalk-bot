# DingTalk Bot

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
access_token = 'xxxxxxxxxxxxxxx'
client = DingBot.client(access_token)
```

发送消息
```ruby
# 发送Text消息
message = DingBot::Message::Text.new('我就是我, 是不一样的烟火',
                                            ['156xxxx8827'],
                                            false)
client.send_msg(message)

# 发送Link消息
message = DingBot::Message::Link.new('我就是我, 是不一样的烟火',
                                     '这个即将发布的新版本，创始人陈航（花名“无招”）称它为“红树林”。',
                                     'https://www.dingtalk.com/',
                                     'https://avatars1.githubusercontent.com/u/64818')
client.send_msg(message)

# 发送Markdown消息
message = DingBot::Message::Markdown.new('我就是我, 是不一样的烟火', '### 我就是我, 是不一样的烟火')
client.send_msg(message)

# 发送整体跳转ActionCard消息
message = DingBot::Message::WholeActionCard.new('乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
                                                '![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅',
                                                '0',
                                                '0',
                                                '阅读全文',
                                                'https://www.dingtalk.com/')
client.send_msg(message)
    
# 发送独立跳转ActionCard类型消息
message = DingBot::Message::IndependentActionCard.new('乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
                                                      '![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅',
                                                      '0',
                                                      '0',
                                                      [
                                                         DingBot::Message::ActionBtn.new('内容不错', 'https://www.dingtalk.com/'),
                                                         DingBot::Message::ActionBtn.new('不感兴趣', 'https://www.dingtalk.com/')
                                                      ])
client.send_msg(message)                                                                 

# 发送FeedCard类型                                            
message = DingBot::Message::FeedCard.new([
                                           DingBot::Message::FeedCardLink.new('时代的火车向前开',
                                                                              'https://avatars1.githubusercontent.com/u/64818',
                                                                              'https://www.dingtalk.com/')
                                         ])
client.send_msg(message)                              
```

## License
Released under the BSD 2-clause license. See LICENSE.txt for details.