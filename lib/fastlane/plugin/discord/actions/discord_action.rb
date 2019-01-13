require 'fastlane/action'
require_relative '../helper/discord_helper'
require 'discordrb/webhooks'

module Fastlane
  module Actions
    class DiscordAction < Action
      def self.run(params)
        UI.message("Notifying Discord")

        if params[:store] == 'ios'
          return self.itunes_notification(params)
          
        self.play_notification(params)
        end
      end

      def self.itunes_notification(params)
        client = Discordrb::Webhooks::Client.new(url: params[:url])
        client.execute do |builder|
          builder.add_embed do |embed|
            embed.title = params[:app_name]
            embed.colour = 0x3c9b00
            embed.url = "https://itunesconnect.apple.com"
            embed.description = "New build uploaded to iTunes Connect with number **#{params[:build_number]}** and version **#{params[:version]}**. "
            embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "iTunes Connect", url: "https://itunesconnect.apple.com", icon_url: "https://i.imgur.com/68CyCSp.png")
            embed.timestamp = Time.now
          end
        end
      end

      def self.play_notification(params)
        client = Discordrb::Webhooks::Client.new(url: params[:url])
        client.execute do |builder|
          builder.add_embed do |embed|
            embed.title = params[:app_name]
            embed.colour = 0x3c9b00
            embed.url = "https://play.google.com/apps/publish"
            embed.description = "New build uploaded to Google Play with number **#{params[:build_number]}** and version **#{params[:version]}**. "
            embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Google Play", url: "https://play.google.com/apps/publish", icon_url: "https://i.imgur.com/yD82bnG.png")
            embed.timestamp = Time.now
          end
        end
      end

      def self.description
        "Discord integration with Fastlane."
      end

      def self.authors
        ["Matheus Gambati"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "DISCORD_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
