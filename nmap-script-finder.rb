#! /usr/bin/env ruby  

# date : arg, 4, 2021
# time : 3:32 pm
# version 1 

class Main 
    # show version
    def version 
        print "nmap-script-finder [ 1.0 ]"
    end

    # help options
    def help 
        print """
    help :
        --help, -h          show help menus
        --version, -v       version check
        --search, -s        search input string 
        """
    end
end

# search script for script db
def script_finder(script_name) 

    fileName = "db/script.db"
    fileMode = "r"
    
    begin 
        file = File.new(fileName, fileMode)
        
        # read file content
        content = file.readlines 
        
        # get one line in file content
        # content.each { |line| puts "line : #{line}"}

        for line in content
            # find match string

            if line.match(script_name) 
                puts line.split('"')[1]
            end
        end    

        # close file 
        file.close 
    rescue
        puts "file not open error"

    end
end

# check args 
main = Main.new

if ARGV.length == 0 
    main.help
    puts

elsif ARGV.length == 1 
    option = ARGV[0]
        
    if option == "--version" or option == '-v'
        puts main.version
    elsif option == "--help" or option == '-h'
        puts main.help
    end

elsif ARGV.length == 2
    option = ARGV[0]
    search_name = ARGV[1]
    
    if option == "--search" or option == '-s' 
        if search_name != "" and search_name != ' '
            script_finder(search_name)
        end
    end
end
