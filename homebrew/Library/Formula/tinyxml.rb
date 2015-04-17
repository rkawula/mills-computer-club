class Tinyxml < Formula
  homepage "http://www.grinninglizard.com/tinyxml/"
  url "https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz"
  sha1 "cba3f50dd657cb1434674a03b21394df9913d764"

  bottle do
    cellar :any
    sha1 "c0939c0120467f4f27f53e62ed9e262935a240f7" => :yosemite
    sha1 "4c8aa1d3c529a87e3aebae4e2f7c425e0c96e29f" => :mavericks
    sha1 "a36a2ebad9f8ec43591edbb522cc7371c60a490d" => :mountain_lion
  end

  option :universal

  depends_on "cmake" => :build

  # The first two patches are taken from the debian packaging of tinyxml.
  #   The first patch enforces use of stl strings, rather than a custom string type.
  #   The second patch is a fix for incorrect encoding of elements with special characters
  #   originally posted at http://sourceforge.net/p/tinyxml/patches/51/
  # The third patch adds a CMakeLists.txt file to build a shared library and provide an install target
  #   submitted upstream as https://sourceforge.net/p/tinyxml/patches/66/
  patch do
    url "https://raw.githubusercontent.com/robotology/yarp/master/extern/tinyxml/patches/enforce-use-stl.patch"
    sha1 "a1e243c0fb2fe3ba0f1138861d781284409116e2"
  end

  patch do
    url "https://raw.githubusercontent.com/robotology/yarp/master/extern/tinyxml/patches/entity-encoding.patch"
    sha1 "a64b7ace370419d36d95452befd82935ef8b0221"
  end

  patch do
    url "https://gist.githubusercontent.com/scpeters/6325123/raw/cfb079be67997cb19a1aee60449714a1dedefed5/tinyxml_CMakeLists.patch"
    sha1 "90c69322296a4144795aa66a94233a9409ff7ea5"
  end

  def install
    ENV.universal_binary if build.universal?
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    (lib+"pkgconfig/tinyxml.pc").write pc_file
  end

  def pc_file; <<-EOS.undent
    prefix=#{opt_prefix}
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include

    Name: TinyXml
    Description: Simple, small, C++ XML parser
    Version: #{version}
    Libs: -L${libdir} -ltinyxml
    Cflags: -I${includedir}
    EOS
  end

  test do
    (testpath/"test.xml").write <<-EOS.undent
      <?xml version="1.0" ?>
      <Hello>World</Hello>
    EOS
    (testpath/"test.cpp").write <<-EOS.undent
      #include <tinyxml.h>

      int main()
      {
        TiXmlDocument doc ("test.xml");
        doc.LoadFile();
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-L#{lib}", "-ltinyxml", "-o", "test"
    system "./test"
  end
end
