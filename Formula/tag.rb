class Tag < Formula
  desc "Manipulate and query tags on macOS files"
  homepage "https://github.com/sneadc/tag/"
  url "https://github.com/sneadc/tag/archive/refs/tags/v2022.3.1.tar.gz"
  sha256 "5eb24552d21f81cf5653ec2b86e54f286238f33006533c2093b76f51dc446ecd"
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
