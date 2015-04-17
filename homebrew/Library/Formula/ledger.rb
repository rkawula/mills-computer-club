class Ledger < Formula
  homepage "http://ledger-cli.org"
  url "https://github.com/ledger/ledger/archive/v3.1.tar.gz"
  sha1 "549aa375d4802e9dd4fd153c45ab64d8ede94afc"

  resource "utfcpp" do
    url "http://downloads.sourceforge.net/project/utfcpp/utf8cpp_2x/Release%202.3.4/utf8_v2_3_4.zip"
    sha1 "638910adb69e4336f5a69c338abeeea88e9211ca"
  end

  bottle do
    revision 2
    sha1 "661106efe731cb8934269f0e9141b6c846b65710" => :yosemite
    sha1 "80b7a33291be43598d5084da49d8783ee7780679" => :mavericks
    sha1 "087576750c2d1df2367a7bac2617e54dbedc2866" => :mountain_lion
  end

  head "https://github.com/ledger/ledger.git"

  deprecated_option "debug" => "with-debug"

  option "with-debug", "Build with debugging symbols enabled"
  option "with-docs", "Build HTML documentation"

  depends_on "mpfr"
  depends_on "gmp"
  depends_on :python => :optional
  depends_on "cmake" => :build

  boost_opts = []
  boost_opts << "c++11" if MacOS.version < "10.9"
  depends_on "boost" => boost_opts
  depends_on "boost-python" => boost_opts if build.with? "python"

  needs :cxx11

  def install
    ENV.cxx11

    (buildpath/"lib/utfcpp").install resource("utfcpp") unless build.head?
    resource("utfcpp").stage { include.install Dir["source/*"] }

    flavor = (build.with? "debug") ? "debug" : "opt"

    opts = %w[-- -DBUILD_DOCS=1]
    args = %W[
      --jobs=#{ENV.make_jobs}
      --output=build
      --prefix=#{prefix}
      --boost=#{Formula["boost"].opt_prefix}
    ]

    if build.with? "docs"
      opts << "-DBUILD_WEB_DOCS=1"
    end

    if build.with? "python"
      # Per #25118, CMake does a poor job of detecting a brewed Python.
      # We need to tell CMake explicitly where our default python lives.
      # Inspired by
      # https://github.com/Homebrew/homebrew/blob/51d054c/Library/Formula/opencv.rb
      args << "--python"
      python_prefix = `python-config --prefix`.strip
      opts << "-DPYTHON_LIBRARY=#{python_prefix}/Python"
      opts << "-DPYTHON_INCLUDE_DIR=#{python_prefix}/Headers"
    end

    args += opts

    system "./acprep", flavor, "make", *args
    system "./acprep", flavor, "make", "doc", *args
    system "./acprep", flavor, "make", "install", *args
    (share+"ledger/examples").install Dir["test/input/*.dat"]
    (share+"ledger").install "contrib"
    (share+"ledger").install "python/demo.py" if build.with? "python"
    (share/"emacs/site-lisp/ledger").install Dir["lisp/*.el", "lisp/*.elc"]
  end

  test do
    balance = testpath/"output"
    system bin/"ledger",
      "--args-only",
      "--file", share/"ledger/examples/sample.dat",
      "--output", balance,
      "balance", "--collapse", "equity"
    assert_equal "          $-2,500.00  Equity", balance.read.chomp
    assert_equal 0, $?.exitstatus

    if build.with? "python"
      system "python", "#{share}/ledger/demo.py"
    end
  end
end
