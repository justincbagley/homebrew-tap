class BgcTools < Formula

  desc "Utilities for automating bgc (Bayesian genomic cline) file prep, analysis, and results plotting"
  homepage "://github.com/justincbagley/bgc_tools"
  url "https://github.com/justincbagley/bgc_tools/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "2a65c08cbd290fe1d277414728e8e9f3b53855ca53feb3f28f5048e69c686431"
  # shasum -a 256 v0.1.0.tar.gz
  
  ## Optionally, specify a repository to be used. Brew then generates a '--HEAD | --head' option. 
  ## Remember to also test it. 'master' is the default branch and doesn't need stating with a
  ## :branch conditional.
  head "https://github.com/justincbagley/bgc_tools.git"

  def install
    prefix.install "LICENSE"
    prefix.install "README.md"
    prefix.install "bgcInstaller.sh"
    prefix.install "bgcPrepper.sh"
    prefix.install "bgc_runner.cfg"
    prefix.install "bgc_runner_default.cfg"
    prefix.install "bgc_sbatch_default.sh"
    prefix.install "estpostCompiler.sh"
      
    if File.file?("#{bin}/bgcInstaller.sh") then
        system "rm", "#{bin}/bgcInstaller.sh"
    end
    if File.file?("#{bin}/bgcPrepper.sh") then
        system "rm", "#{bin}/bgcPrepper.sh"
    end
    if File.file?("#{bin}/bgc_sbatch_default.sh") then
        system "rm", "#{bin}/bgc_sbatch_default.sh"
    end
    if File.file?("#{bin}/estpostCompiler.sh") then
        system "rm", "#{bin}/estpostCompiler.sh"
    end
  end

  # def post_install
  #   system "bash", "add_switchjdk_to_bash_profile_safely.sh"
  # end

  # def caveats; <<-EOS
  #   Your ~/.bash_profile had a couple of lines added to it to make switchjdk available on the command line.
  #   They will still be there after an uninstall, but are adaptive (nothing happens if switchjdk was uninstalled)
  #   If you're a zsh person, then patches are welcome: https://github.com/paul-hammant/switchjdk/blob/master/add_switchjdk_to_bash_profile_safely.sh
  #  EOS
  # 
  # end

  test do
    system "false"
    system "bgcInstaller.sh.sh", "--version"
  end

end
