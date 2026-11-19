# Written by scripts/release.sh in the etrans repository with each release
# (build/etrans.rb), and copied here.
cask "etrans" do
  version "0.9.7"
  sha256 "ec95c13055a71502d33a2bbaa2903d36af3b6742568e15b25cd180ed5980dd81"

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
