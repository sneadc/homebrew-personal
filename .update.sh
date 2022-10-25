#!/usr/bin/env zsh

repo="sneadc/tag"
latest_tag="$(curl -s GET https://api.github.com/repos/$repo/tags | \
  jq -r '.[0].name')"
latest_url="https://github.com/$repo/archive/refs/tags/$latest_tag.tar.gz"
latest_sha="$(curl $latest_url | sha256sum | awk '{print $1}')"

cat > Formula/tag.rb <<_EOF
class Tag < Formula
  desc "Manipulate and query tags on macOS files"
  homepage "https://github.com/$repo/"
  url "$latest_url"
  sha256 "$latest_sha"
  license "MIT"
  revision 1
  head "https://github.com/$repo.git", branch: "master"

  depends_on :macos

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    test_tag = "test_tag"
    test_file = Pathname.pwd+"test_file"
    touch test_file
    system "#{bin}/tag", "--add", test_tag, test_file
    assert_equal test_tag, \`#{bin}/tag --list --no-name #{test_file}\`.chomp
  end
end
_EOF
