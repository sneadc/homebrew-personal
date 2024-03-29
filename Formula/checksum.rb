class Checksum < Formula
  desc "Fast sha{1,224,256,512}sum replacement"
  homepage "https://github.com/sneadc/checksum/"
  url "https://github.com/sneadc/checksum/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fdc10448de2976e001905d7c7b3166a07821245fc03e50dc4c9777938b7bbf25"
  license "MIT"
  revision 1
  head "https://github.com/sneadc/checksum.git", branch: "main"

  depends_on :macos

  def install
    # system "pip", "install", "-e", "."
  end

  test do
    test_checksum = "da39a3ee5e6b4b0d3255bfef95601890afd80709"
    test_file = Pathname.pwd+"test_file"
    touch test_file
    assert_equal test_checksum, `#{bin}/checksum #{test_file}`.chomp
  end
end
