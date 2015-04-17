require "formula"

class Vifm < Formula
  homepage "http://vifm.sourceforge.net/index.html"
  url "https://downloads.sourceforge.net/project/vifm/vifm/vifm-0.7.8.tar.bz2"
  sha256 '5dfbb26c2038a58dcff12026dab736e29d547b4aa3ff5912e4d844064c9e7603'

  bottle do
    sha1 "9c91b72060c3fb9abf43cecc1a2304816deb0334" => :yosemite
    sha1 "f6adc73279074c20f52dcb355bff076bf31cca40" => :mavericks
    sha1 "cc3f9c80da284c39c2460f81eb53ec9bc98ccded" => :mountain_lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    ENV.deparallelize
    system "make install"
  end
end
