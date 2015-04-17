class Osxutils < Formula
  homepage "https://github.com/vasi/osxutils"
  head "https://github.com/vasi/osxutils.git"
  url "https://github.com/vasi/osxutils/archive/v1.8.1.tar.gz"
  sha1 "b6c0e2b0c699a4bf9d51c582c8107ce40cfdec8b"

  bottle do
    cellar :any
    sha1 "b2b540572693c94922b19b7109fb337bc45ffddf" => :yosemite
    sha1 "1f29480eab579c4f97606aabe89d8b39c1c440dd" => :mavericks
    sha1 "a76a3906847c9bdfa934ee46c7bcdeee772f1c26" => :mountain_lion
  end

  conflicts_with "trash", :because => 'both install a trash binary'
  conflicts_with "leptonica",
    :because => "both leptonica and osxutils ship a `fileinfo` executable."
  conflicts_with "googlecl", :because => 'both install a google binary'

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/trash"
  end
end
