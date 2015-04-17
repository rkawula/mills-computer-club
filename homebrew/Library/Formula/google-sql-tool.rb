class GoogleSqlTool < Formula
  homepage "https://developers.google.com/cloud-sql/docs/commandline"
  url "https://dl.google.com/cloudsql/tools/google_sql_tool.zip"
  sha256 "b7e993edab12da32772bfa90c13999df728f06792757c496140d729d230b03c3"
  version "r10"

  def install
    # Patch script to find jar
    chmod 0755, "google_sql.sh"
    inreplace "google_sql.sh",
      'SQL_SH_DIR="$(cd $(dirname $0); pwd)"',
      "SQL_SH_DIR=\"#{libexec}\""

    libexec.install ["google_sql.sh", "google_sql.jar"]
    bin.install_symlink libexec+("google_sql.sh") => "google_sql"
  end
end
