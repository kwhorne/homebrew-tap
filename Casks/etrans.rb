# Written by scripts/release.sh in the etrans repository with each release
# (build/etrans.rb), and copied here.
cask "etrans" do
  version "0.9.3"
  sha256 "422151c2a28268c04e452d1511010ce098aed700abbbde2dfb9c70362ef9c229"

  url "https://elyracode.com/downloads/etrans/etrans-#{version}-arm64.dmg"
  name "etrans"
  desc "SSH, SFTP, S3 and WebDAV client"
  homepage "https://elyracode.com/etrans"

  livecheck do
    url "https://elyracode.com/etrans/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # The app updates itself.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "etrans.app"

  # Passwords and passphrases are in the login Keychain, under no.gets.etrans,
  # which a zap does not reach; Keychain Access removes them.
  zap trash: [
    "~/Library/Application Support/etrans",
    "~/Library/Caches/etrans",
    "~/Library/Saved Application State/no.gets.etrans.savedState",
  ]
end
