require "formula"

class Hashcash < Formula
  homepage "http://hashcash.org"
  url "http://hashcash.org/source/hashcash-1.22.tgz"
  sha1 "0fa03c9f266026e505c0ab7b671ad93aef9310de"

  bottle do
    cellar :any
    sha1 "c816296851be064a24cfd568acfa485731909877" => :yosemite
    sha1 "9c6255cf6ca2b0fc0778468119272ecab94308b5" => :mavericks
  end

  def install
    system "make", "install",
                   "PACKAGER=HOMEBREW",
                   "INSTALL_PATH=#{bin}",
                   "MAN_INSTALL_PATH=#{man1}",
                   "DOC_INSTALL_PATH=#{doc}"
  end

  test do
    system "#{bin}/hashcash", "-mb10", "test@example.com"
  end
end
