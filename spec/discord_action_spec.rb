describe Fastlane::Actions::DiscordAction do
  describe '#run' do
    it 'Send notification' do
      expect(Fastlane::UI).to receive(:message).with("Notifying Discord")
      WEBHOOK_URL = 'Discord Hook Here'

      Fastlane::Actions::DiscordAction.run(store: 'ios', app_name: 'IMEA', build_number: 29, version: '2.0.18', url: WEBHOOK_URL)
    end
  end
end
