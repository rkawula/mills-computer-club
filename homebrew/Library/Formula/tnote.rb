class Tnote < Formula
  homepage "http://tnote.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/tnote/tnote/tnote-0.2.1/tnote-0.2.1.tar.gz"
  sha1 "8d5d3694b921191c7e91e8907ec6c6970ce29ec6"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
    man1.install Dir[libexec/"share/man/man1/*"]
  end

  test do
    ENV["TERM"] = "xterm"
    ENV["EDITOR"] = `which cat`.chomp
    system "#{bin}/tnote", "--nocol", "-a", "test"
  end
end
