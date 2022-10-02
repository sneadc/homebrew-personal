class Tag < Formula
  desc "Manipulate and query tags on macOS files"
  homepage "https://github.com/sneadc/tag/"
  url "https://github.com/sneadc/tag/archive/refs/tags/v2022.4.01.tar.gz"
  sha256 "8b7a2c72fc7d3042ddd96dd41f0bc9c234f4b7bb41ecdb4a9fc0a22e9510b39d"
  license "MIT"
  revision 1
  head "https://github.com/sneadc/tag.git", branch: "master"

  depends_on :macos

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    test_tag = "test_tag"
    test_file = Pathname.pwd+"test_file"
    touch test_file
    system "#{bin}/tag", "--add", test_tag, test_file
    assert_equal test_tag, `#{bin}/tag --list --no-name #{test_file}`.chomp
  end
end
