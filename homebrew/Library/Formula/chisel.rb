require "formula"

class Chisel < Formula
  homepage "https://github.com/facebook/chisel"
  url "https://github.com/facebook/chisel/archive/1.2.0.tar.gz"
  sha1 "c4c2bf25035cc15f10a10290023a6f8ce23ba1da"

  def install
    libexec.install Dir["*.py", "commands"]
    prefix.install "PATENTS"
  end

  def caveats; <<-EOS.undent
    Add the following line to ~/.lldbinit to load chisel when Xcode launches:
      command script import #{opt_libexec}/fblldb.py
    EOS
  end

  test do
    xcode_path = `xcode-select --print-path`.strip
    lldb_rel_path = "Contents/SharedFrameworks/LLDB.framework/Resources/Python"
    ENV["PYTHONPATH"] = "#{xcode_path}/../../#{lldb_rel_path}"
    system "python #{libexec}/fblldb.py"
  end
end
