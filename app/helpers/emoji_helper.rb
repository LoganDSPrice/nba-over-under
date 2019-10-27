module EmojiHelper
  def self.emojify(content)
    content.to_str.gsub(/:([\w+-]+):/) do |match|
      emoji = Emoji.find_by_alias($1)
      emoji ? emoji.raw : match
    end.html_safe if content.present?
  end
end