class Sqlmap < Formula
  homepage "http://sqlmap.org"
  url "https://github.com/sqlmapproject/sqlmap/archive/0.9.tar.gz"
  sha1 "25d7c13fc6e8bb55a1b4d9ba60a7ebd558ad0374"
  head "https://github.com/sqlmapproject/sqlmap.git"
  bottle do
    cellar :any
    sha1 "7873a7afe52b4799d46aabcb33f70e034b892153" => :yosemite
    sha1 "2ac99f9ed995d834cb31022f557599edf0e3776d" => :mavericks
    sha1 "db0f7c28bcd5dcc58f0af60608d5f4e67cee149f" => :mountain_lion
  end

  revision 1

  def install
    libexec.install Dir["*"]

    bin.install_symlink libexec/"sqlmap.py"
    bin.install_symlink bin/"sqlmap.py" => "sqlmap"

    if build.head?
      bin.install_symlink libexec/"sqlmapapi.py"
      bin.install_symlink bin/"sqlmapapi.py" => "sqlmapapi"
    end
  end

  test do
    query_path = testpath/"school_insert.sql"
    query_path.write <<-EOS.undent
      create table students (name text, age integer);
      insert into students (name, age) values ('Bob', 14);
      insert into students (name, age) values ('Sue', 12);
      insert into students (name, age) values ('Tim', 13);
    EOS

    query_select = "select name, age from students order by age asc;"

    # Create the test database
    `sqlite3 < #{query_path} school.sqlite`

    output = `#{bin}/sqlmap --batch -d "sqlite://school.sqlite" --sql-query "#{query_select}"`
    assert_match /Bob,\s14/, output
    assert_match /Sue,\s12/, output
    assert_match /Tim,\s13/, output
  end
end
