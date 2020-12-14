class TeamsAttendance < Formula

  desc "Bash script to summarize Microsoft Teams Participant attendance data"
  homepage "https://github.com/justincbagley/Teams-Attendance"
  url "https://github.com/justincbagley/Teams-Attendance/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "6dba055a89fb1c325a981540ec6abda47be91b13ef3f46c8062c870c44db8456"
  # shasum -a 256 v0.1.0.tar.gz
  
  ## Optionally, specify a repository to be used. Brew then generates a '--HEAD | --head' option. 
  ## Remember to also test it. 'master' is the default branch and doesn't need stating with a
  ## :branch conditional.
  head "https://github.com/justincbagley/Teams-Attendance.git"

  def install
    prefix.install "LICENSE"
    prefix.install "README.md"
    prefix.install "teams_attendance.sh"
    if File.file?("#{bin}/teams_attendance.sh") then
        system "rm", "#{bin}/teams_attendance.sh"
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
    system "teams_attendance.sh", "--version"
  end

end
