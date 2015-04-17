require "formula"

class GoInstalled < Requirement
  fatal true
  default_formula "go"
  satisfy { which "go" }

  def message
    "Go is required to use gpm."
  end
end

class Gpm < Formula
  homepage "https://github.com/pote/gpm"
  url "https://github.com/pote/gpm/archive/v1.3.2.tar.gz"
  sha1 "2ad332aa2d711cb901ce4c2be72a254ecc5f20eb"

  bottle do
    cellar :any
    sha1 "488291cfa92867caf806bb270e0734d0d5af5314" => :yosemite
    sha1 "7339121dd321f16a146a6f9d752d5044452eefda" => :mavericks
    sha1 "1fc18dc8ade7f9307648d603deb8a79ccf587fe7" => :mountain_lion
  end

  depends_on GoInstalled

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    Pathname("Godeps").write "github.com/pote/gpm-testing-package v6.1"

    ENV["GOPATH"] = testpath
    system bin/"gpm", "install"

    Pathname("go_code.go").write <<-EOS.undent
      package main

      import (
              "fmt"
              "github.com/pote/gpm-testing-package"
      )

      func main() {
              fmt.Print(gpm_testing_package.Version())
      }
    EOS

    out = `go run go_code.go`
    assert_equal "v6.1", out
    assert_equal 0, $?.exitstatus
  end
end
