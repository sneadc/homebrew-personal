class Tag < Formula
  desc "Manipulate and query tags on macOS files"
  homepage "https://github.com/sneadc/tag/"
  url "https://github.com/sneadc/tag/archive/refs/tags/v2022.4.04.tar.gz"
  sha256 "a0a57356767eebbad0023e285b7317e08269270e095cc850bc57f852dc0d8c60"
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
