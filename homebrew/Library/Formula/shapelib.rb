require 'formula'

class Shapelib < Formula
  homepage 'http://shapelib.maptools.org/'
  url 'http://download.osgeo.org/shapelib/shapelib-1.3.0.tar.gz'
  sha1 '599fde6f69424fa55da281506b297f3976585b85'

  bottle do
    cellar :any
    revision 1
    sha1 "94876630b25d3118459e6ed1f993a155617ad2ab" => :yosemite
    sha1 "f084d8d30da0f0859527e9c747809e7ad5ea0d07" => :mavericks
    sha1 "0f7ade9614306874b162d89c14ca74c0048281d2" => :mountain_lion
  end

  def install
    dylib = lib+"libshp.#{version}.dylib"

    system "make", "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "PREFIX=#{prefix}"

    lib.mkpath
    system ENV.cc, *%W[-dynamiclib -Wl,-all_load
                       -Wl,-install_name,#{dylib}
                       -Wl,-headerpad_max_install_names
                       -Wl,-compatibility_version,#{version}
                       -o #{dylib}
                       shpopen.o shptree.o dbfopen.o safileio.o]

    include.install "shapefil.h"
    bin.install %w[shpcreate shpadd shpdump shprewind dbfcreate dbfadd dbfdump shptreedump]

    lib.install_symlink dylib.basename => "libshp.#{version.to_s.split(".").first}.dylib"
    lib.install_symlink dylib.basename => "libshp.dylib"
  end
end
