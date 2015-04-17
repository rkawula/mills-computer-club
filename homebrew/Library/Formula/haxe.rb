require "formula"

class Haxe < Formula
  homepage "http://haxe.org"

  stable do
    url "https://github.com/HaxeFoundation/haxe.git", :tag => "3.1.3", :revision => "7be30670b2f1f9b6082499c8fb9e23c0a6df6c28"
    # Remove the below with the next stable release
    depends_on MaximumMacOSRequirement => :mavericks
  end

  bottle do
    cellar :any
    sha1 "83fe01c0ca2997328e88ef7763181ff40cc5082a" => :mavericks
    sha1 "46c5911f3505c7e102c71dde16ed4ab2bdcc4cbc" => :mountain_lion
    sha1 "408dbaf0110cb38ee52900bd4910c56913681bab" => :lion
  end

  head do
    url "https://github.com/HaxeFoundation/haxe.git", :branch => "development"
  end

  depends_on "objective-caml" => :build
  depends_on "camlp4" => :build
  depends_on "neko" => :optional

  def install
    # Build requires targets to be built in specific order
    ENV.deparallelize
    system "make", "OCAMLOPT=ocamlopt.opt"
    bin.mkpath
    system "make", "install", "INSTALL_BIN_DIR=#{bin}", "INSTALL_LIB_DIR=#{lib}/haxe"

    # Replace the absolute symlink by a relative one,
    # such that binary package created by homebrew will work in non-/usr/local locations.
    rm bin/"haxe"
    bin.install_symlink lib/"haxe/haxe"
  end

  test do
    ENV["HAXE_STD_PATH"] = "#{HOMEBREW_PREFIX}/lib/haxe/std"
    system "#{bin}/haxe", "-v", "Std"
  end

  def caveats; <<-EOS.undent
    Add the following line to your .bashrc or equivalent:
      export HAXE_STD_PATH="#{HOMEBREW_PREFIX}/lib/haxe/std"
    EOS
  end
end
