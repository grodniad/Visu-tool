# encoding: utf-8

require 'colored'
require 'open3'



def getPath
	
	var = File.exist?("path.txt")
	toWrite = "@echo off
		echo %~dp0
		popd"
	
	File.open('path.bat', 'a') do |f2|
	    f2.puts "#{toWrite}"
	end
	
	createFile = 'path.bat'
	system(createFile)
	stdout, stdeerr, status = Open3.capture3(createFile)
    puts "\n"
    scriptPath = stdout.gsub!("\n",'')

	if var == false
		dir_name = "crowdin_strings"
	    Dir.mkdir(dir_name) unless File.exists?(dir_name)
	    print "Please add the path to the string folder from WoowFolder:
	    Path should be: <projectPath>\\app\\src\\main\\res

	    "
	    print "Paste here: "
	    getInput = gets.chomp
	    projectPath = getInput

	    File.open('path.txt', 'a') do |f2|
	    	f2.puts "#{projectPath}"
	    end
	end 

	finalPath = File.read('path.txt').gsub!("\n",'')
	checkIfEmpty = Dir.glob 'crowdin_strings/*/'

	if checkIfEmpty.empty? == true
		system "cls"
		puts"
▓▓▓▓ 
▒▒▒▓▓ 
▒▒▒▒▒▓ 
▒▒▒▒▒▒▓ 
▒▒▒▒▒▒▓ 
▒▒▒▒▒▒▒▓ 
▒▒▒▒▒▒▒▓▓▓ 
▒▓▓▓▓▓▓░░░▓ 
▒▓░░░░▓░░░░▓ 
▓░░░░░░▓░▓░▓ 
▓░░░░░░▓░░░▓ 
▓░░▓░░░▓▓▓▓ 
▒▓░░░░▓▒▒▒▒▓ 
▒▒▓▓▓▓▒▒▒▒▒▓ 
▒▒▒▒▒▒▒▒▓▓▓▓ 
▒▒▒▒▒▓▓▓▒▒▒▒▓ 
▒▒▒▒▓▒▒▒▒▒▒▒▒▓   DOH!!
▒▒▒▓▒▒▒▒▒▒▒▒▒▓ 
▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓ 
▒▓▒▓▒▒▒▒▒▒▒▒▒▓ 
▒▓▒▓▓▓▓▓▓▓▓▓▓ 
▒▓▒▒▒▒▒▒▒▓ 
▒▒▓▒▒▒▒▒▓ "
		puts "\n"
		puts "\n"
		puts " Crowdin_strings folder / project path folder is empty "
		puts " Plese check if the following paths are correct:

		Script path: #{scriptPath}
		Project path: #{finalPath}
		"
		File.delete('path.bat')
		print " Press any key to continue... "
		abc = gets.chomp
		abort
	end

	arabic = "xcopy /s #{scriptPath}crowdin_strings\\ar\\strings.xml #{finalPath}\\values-ar /Y"
	german = "xcopy /s #{scriptPath}crowdin_strings\\de\\strings.xml #{finalPath}\\values-de /Y"
	spanish = "xcopy /s #{scriptPath}crowdin_strings\\es-ES\\strings.xml #{finalPath}\\values-es /Y"
	french = "xcopy /s #{scriptPath}crowdin_strings\\fr\\strings.xml #{finalPath}\\values-fr /Y"
	hindi = "xcopy /s #{scriptPath}crowdin_strings\\hi\\strings.xml #{finalPath}\\values-hi /Y"
	indonesian = "xcopy /s #{scriptPath}crowdin_strings\\id\\strings.xml #{finalPath}\\values-in /Y"
	italian = "xcopy /s #{scriptPath}crowdin_strings\\it\\strings.xml #{finalPath}\\values-it /Y"
	japanese = "xcopy /s #{scriptPath}crowdin_strings\\ja\\strings.xml #{finalPath}\\values-ja /Y"
	korean = "xcopy /s #{scriptPath}crowdin_strings\\ko\\strings.xml #{finalPath}\\values-ko /Y"
	malay = "xcopy /s #{scriptPath}crowdin_strings\\ms\\strings.xml #{finalPath}\\values-ms /Y"
	polish = "xcopy /s #{scriptPath}crowdin_strings\\pl\\strings.xml #{finalPath}\\values-pl /Y"
	portuguese = "xcopy /s #{scriptPath}crowdin_strings\\pt-PT\\strings.xml #{finalPath}\\values-pt /Y"
	brazilian = "xcopy /s #{scriptPath}crowdin_strings\\pt-BR\\strings.xml #{finalPath}\\values-pt-rBR /Y"
	russian = "xcopy /s #{scriptPath}crowdin_strings\\ru\\strings.xml #{finalPath}\\values-ru /Y"
	thai = "xcopy /s #{scriptPath}crowdin_strings\\th\\strings.xml #{finalPath}\\values-th /Y"
	turkish = "xcopy /s #{scriptPath}crowdin_strings\\tr\\strings.xml #{finalPath}\\values-tr /Y"
	urdu = "xcopy /s #{scriptPath}crowdin_strings\\ur-PK\\strings.xml #{finalPath}\\values-ur-rPK /Y"
	vietnamese = "xcopy /s #{scriptPath}crowdin_strings\\vi\\strings.xml #{finalPath}\\values-vi /Y"
	chinese = "xcopy /s #{scriptPath}crowdin_strings\\zh-CN\\strings.xml #{finalPath}\\values-zh-rCN /Y"
	romanian = "xcopy /s #{scriptPath}crowdin_strings\\ro\\strings.xml #{finalPath}\\values-ro-xhdpi /Y"
	# to add when ready
	czech = "xcopy /s #{scriptPath}crowdin_strings\\cs\\strings.xml #{finalPath}\\values-ro-xhdpi /Y"

	executeBatch = "execute.bat"
	File.open(executeBatch, 'a') do |f2|
	  	f2.puts "#{arabic}\n#{german}\n#{spanish}\n#{french}\n#{hindi}\n#{indonesian}\n#{italian}\n#{japanese}\n#{korean}\n#{malay}\n#{polish}\n#{portuguese}\n#{brazilian}\n#{russian}\n#{thai}\n#{turkish}\n#{urdu}\n#{vietnamese}\n#{chinese}\n#{romanian}"
	end


	system "cls"
	puts " 
	All is ready, press ENTER to start..."
	enter = gets.chomp
	start = Time.new
	system(executeBatch)

	File.delete('execute.bat')
	File.delete('path.bat')
	ended = Time.new
	system "cls"

	

	puts "\n"
	puts "
░░░░░░░░░░░░░░░░░░░ ░░█████████
░░███████░░░░░░░░░░███▒▒▒▒▒▒▒▒███
░░█▒▒▒▒▒▒█░░░░░░░███▒▒▒▒▒▒▒▒▒▒▒▒▒███
░░░█▒▒▒▒▒▒█░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░░░░█▒▒▒▒▒█░░░██▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒███
░░░░░█▒▒▒█░░░█▒▒▒▒▒▒████▒▒▒▒████▒▒▒▒▒▒██
░░░█████████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░░░█▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒██
░██▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒██▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██
██▒▒▒███████████▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒▒██
█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒████████▒▒▒▒▒▒▒██
██▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░█▒▒▒███████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██
░██▒▒▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
░░████████████░░░█████████████████"
	puts "\n"
	puts " All done! Hope this script made your life easier"
	puts "						Made by Claudiu B"
	puts "						Made for Florin 'Juliano' Zanfir"
	puts "\n"
	scriptTimer = ended - start 
	timerToSeconds = scriptTimer.to_s
	timeToDisplay = timerToSeconds[0...4]
	puts " Script run time: #{timeToDisplay} seconds"
	puts " Press ENTER to close script and delete crowdin_strings folder content"
	exit = gets.chomp
end

def remove_dir(path)
  if File.directory?(path)
    Dir.foreach(path) do |file|
      if ((file.to_s != ".") and (file.to_s != ".."))
        remove_dir("#{path}/#{file}")
      end
    end
    # Dir.delete(path)
  else
    File.delete(path)
  end
end


getPath
remove_dir("crowdin_strings")