require "formula"

class Transcrypt < Formula
  homepage "https://github.com/elasticdog/transcrypt#readme"
  url "https://github.com/elasticdog/transcrypt/archive/v0.9.7.tar.gz"
  sha1 "af986db13069df0a9ce16e1bde1eaf6edc9a0317"
  head "https://github.com/elasticdog/transcrypt.git"

  def install
    bin.install "transcrypt"
    man.install "man/transcrypt.1"
    bash_completion.install "contrib/bash/transcrypt"
    zsh_completion.install "contrib/zsh/_transcrypt"
  end

  test do
    system "git", "init"
    system bin/"transcrypt", "--password", "guest", "--yes"

    (testpath/".gitattributes").atomic_write <<-EOS.undent
      sensitive_file  filter=crypt diff=crypt
    EOS
    (testpath/"sensitive_file").write "secrets"
    system "git", "add", ".gitattributes", "sensitive_file"
    system "git", "commit", "--message", "Add encrypted version of file"

    assert_equal `git show HEAD:sensitive_file --no-textconv`.chomp,
                 "U2FsdGVkX1/BC5TmOtJ9kCgCq4EmYX0crGU7mAIhDEA="
  end
end
