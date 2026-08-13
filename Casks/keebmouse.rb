cask "keebmouse" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/gapul/homebrew-tap/releases/download/v#{version}/keebmouse-#{version}-macos-arm64.zip"
  name "keebmouse"
  desc "キーボードでポインタを動かす常駐アプリ (Hyper+Shift+G でモード切替)"
  homepage "https://github.com/gapul/keebmouse"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "keebmouse.app"

  # 常駐は dotfiles の launchd.agents.keebmouse が持つ。cask 側で launchctl を触ると
  # アップグレードのたびに sudo を求められる(keystats の cask と同じ理由)。
  uninstall quit: "net.gapul.keebmouse"

  zap trash: [
    "~/Library/LaunchAgents/net.gapul.keebmouse.plist",
  ]
end
