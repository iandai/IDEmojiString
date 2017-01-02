Pod::Spec.new do |s|
    s.name         = 'IDEmojiString'
    s.version      = '1.0.3'
    s.summary      = 'A libarary that detects and removes Emoji.'
    s.homepage     = 'https://github.com/iandai/IDEmojiString'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { 'Ian Dai' => 'iandaicsu@gmail.com' }
    s.source       = { :git => 'https://github.com/iandai/IDEmojiString.git', :tag => '1.0.3' }
    s.source_files = 'IDEmojiString/*{h,m}'
    s.exclude_files= 'IDEmojiString/main.m'
    s.resources    = "IDEmojiString/emoji.plist"
    s.framework    = 'Foundation'
end
