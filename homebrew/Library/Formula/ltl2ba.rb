require "formula"

class Ltl2ba < Formula
  homepage "http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/"
  url "http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/ltl2ba-1.2b1.tar.gz"
  sha1 "74cff4914203753544bf300e041f433dbaeb3289"

  bottle do
    cellar :any
    sha1 "d61bce916a95929af945b61870ef7be361190a42" => :yosemite
    sha1 "b57bf1f7810ba24b109807e8f6dbfbdc69b84c48" => :mavericks
    sha1 "6cd5fd42349d5bd780e9c38356277e0e0383a419" => :mountain_lion
  end

  def install
    system "make"
    bin.install "ltl2ba"
  end
end
