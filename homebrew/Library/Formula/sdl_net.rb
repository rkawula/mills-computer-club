require 'formula'

class SdlNet < Formula
  homepage 'http://www.libsdl.org/projects/SDL_net/'
  url 'http://www.libsdl.org/projects/SDL_net/release/SDL_net-1.2.8.tar.gz'
  sha1 'fd393059fef8d9925dc20662baa3b25e02b8405d'

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'sdl'

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-sdltest"
    system "make install"
  end
end
