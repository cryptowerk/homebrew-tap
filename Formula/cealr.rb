class Cealr < Formula
  desc "Seal files in blockchains"
  homepage "https://github.com/cryptowerk/cealr"
  url "https://github.com/cryptowerk/cealr/archive/v0.1.tar.gz"
  sha256 "f9f405dbbad2472ecb9aa4e0201ea9bb1daf0d68b3db91d9874d049bd1ad11b6"
  depends_on "cmake" => :build
  depends_on "openssl"
  depends_on "nlohmann/json/nlohmann_json"

  def install
    Dir.mkdir("build")
    Dir.mkdir("build/debug")
    # system "mkdir", "-p", "build/debug"
    Dir.chdir("build/debug")
    system "cmake", "../..", *std_cmake_args
    Dir.chdir("../..")
    system "cmake", "--build", "build/debug"
    Dir.chdir("build/debug")
    bin.install "cealr"
  end

  test do
    system "#{bin}/cealr", "--help"
  end
end
