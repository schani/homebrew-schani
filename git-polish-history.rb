require "language/go"

class GitPolishHistory < Formula
  homepage "https://github.com/schani/git-polish-history"
  url "https://github.com/schani/git-polish-history/archive/v0.2.tar.gz"
  sha1 "f4cfea59b0e16a7ddf2ee3c9eb9fb5b51391b05e"

  depends_on "go" => :build

  go_resource "github.com/schani/gogit" do
    url "https://github.com/schani/gogit.git",
        :revision => "697fb854ce8fbfd79594c66aea7c06001c9ddf7e"
  end

  go_resource "github.com/codegangsta/cli" do
    url "https://github.com/codegangsta/cli.git",
        :revision => "50c77ecec0068c9aef9d90ae0fd0fdf410041da3"
  end

  def install
    ENV["GOPATH"] = buildpath
    Language::Go.stage_deps resources, buildpath/"src"

    system "go", "build", "-o", "git-polish-history"
    bin.install "git-polish-history"
  end

  test do
    system "#{bin}/git-polish-history", "help"
  end
end
