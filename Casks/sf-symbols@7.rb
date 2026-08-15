cask "sf-symbols@7" do
  version "7.2"
  sha256 :no_check # Apple はこの URL を同じ名前のまま差し替えるので固定できない

  url "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-#{version.major}.dmg"
  name "SF Symbols"
  desc "Apple の SF Symbols カタログ (安定版)"
  homepage "https://developer.apple.com/sf-symbols/"

  # homebrew/cask の sf-symbols は macOS 15 以降だと 8.0 beta を入れる。beta は
  # "SF Symbols Beta.app" という名前で入るので Spotlight でも beta として並ぶ。
  # 安定版が欲しいだけなのでこちらに固定する。8 が正式リリースされたら本家に戻す。
  conflicts_with cask: "sf-symbols"

  auto_updates true
  depends_on macos: :big_sur

  pkg "SF Symbols.pkg"

  uninstall pkgutil: "com.apple.pkg.SFSymbols"

  zap trash: "~/Library/Preferences/com.apple.SFSymbols.plist"
end
