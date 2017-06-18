require "bundler/setup"
require "dingbot"

begin
  # DingBot.http_proxy('127.0.0.1', '8888')
  client = DingBot.client('xxxxxxxxxxxxxxx')

  text_message = DingBot::Message::Text.new('我就是我, 是不一样的烟火',
                                            ['13718896117'],
                                            false)


  link_message = DingBot::Message::Link.new('我就是我, 是不一样的烟火',
                                            '这个即将发布的新版本，创始人陈航（花名“无招”）称它为“红树林”。',
                                            'https://mp.weixin.qq.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI',
                                            'https://avatars1.githubusercontent.com/u/64818')


  markdown_message = DingBot::Message::Markdown.new('我就是我, 是不一样的烟火', '### 我就是我, 是不一样的烟火')

  whole_action_card_message = DingBot::Message::WholeActionCard.new('乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
                                                                    '![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅',
                                                                    '0',
                                                                    '0',
                                                                    '阅读全文',
                                                                    'https://www.dingtalk.com/')

  indpt_action_card_message = DingBot::Message::IndependentActionCard.new('乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身',
                                                                          '![screenshot](@lADOpwk3K80C0M0FoA) ### 乔布斯 20 年前想打造的苹果咖啡厅',
                                                                          '0',
                                                                          '0',
                                                                          [
                                                                              DingBot::Message::ActionBtn.new('内容不错', 'https://www.dingtalk.com/'),
                                                                              DingBot::Message::ActionBtn.new('不感兴趣', 'https://www.dingtalk.com/')
                                                                          ])

  feed_card_message = DingBot::Message::FeedCard.new([
                                                         DingBot::Message::FeedCardLink.new('时代的火车向前开',
                                                                                            'https://avatars1.githubusercontent.com/u/64818',
                                                                                            'https://mp.weixin.qq.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI'
                                                         ),
                                                     ])

  puts client.send_msg(feed_card_message)
rescue => e
  puts e.message
end