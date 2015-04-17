require "formula"

class Espeak < Formula
  homepage "http://espeak.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/espeak/espeak/espeak-1.48/espeak-1.48.04-source.zip"
  sha1 "b22c0361885d05e61d98ecedca0a4926ea2fb2ad"

  bottle do
    sha1 "1b9b6c5acb2b98aa068f4b54b91ac463c07081d1" => :mavericks
    sha1 "83f5b1428558b5de444b44f53aa1f8b52dab9460" => :mountain_lion
    sha1 "a86e2086deea0f1bee08eef53ef739bd633ce2c9" => :lion
  end

  depends_on "portaudio"

  def install
    share.install "espeak-data"
    cd "src" do
      rm "portaudio.h"
      system "make", "speak", "DATADIR=#{share}/espeak-data", "PREFIX=#{prefix}"
      bin.install "speak" => "espeak"
    end
  end

  test do
    system "#{bin}/espeak", "This is a test for Espeak.", "-w", "out.wav"
  end
end
