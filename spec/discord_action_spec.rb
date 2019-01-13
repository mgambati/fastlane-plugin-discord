describe Fastlane::Actions::DiscordAction do
  describe '#run' do
    it 'Send notification about itunes' do
      expect(Fastlane::UI).to receive(:message).with("Notifying Discord")
      WEBHOOK_URL = ENV['DISCORD_TEST_WEBHOOK']

      Fastlane::Actions::DiscordAction.run(store: 'ios', app_name: 'IMEA', build_number: 1, version: '1.0.0', url: WEBHOOK_URL)
    end

    it 'Send notification about google play' do
      expect(Fastlane::UI).to receive(:message).with("Notifying Discord")
      WEBHOOK_URL = ENV['DISCORD_TEST_WEBHOOK']

      Fastlane::Actions::DiscordAction.run(app_name: 'IMEA', build_number: 1, version: '1.0.0', url: WEBHOOK_URL)
    end
  end
end
