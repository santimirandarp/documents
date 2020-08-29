
    <h3>Shortcurts</h3>
    ## ENVIRONMENTAL VARIABLES
    /usr/bin/env also (env) --> show environment variables. 
    /etc/environment -> place to write variables
    or in etc/profile using export
    unset varName --> removes variables from environment or from shell 
    #Bash aliases are an ubuntu invention. Normally they are on .bashrc and variables on .profile.
    #In lubuntu anyways is ok to set aliases on bash_aliases


    ## REDIRECTION 
    When commands & bins run many things happen: stdin(0), stdout(1) and stderr(2) are open
    An exit code is generated but not output. It is stored 
    in the exit status '?=exit status'  accessed as $?, print using echo $?. 
    Counter intuitive: 0 sucessful, unsucessful.

    Chaining of commands using exit code
    grep 'hello' bash_aliases && echo 'find it!' || echo 'didnt find it!'
    ls -a ||  echo 'I like your mom'

    Output redirection:
    redirection of anything appearing on the terminal to a file: firefox-developer 2 > /dev/null

    Processes: fg, bg, C-z
    firefox-developer & # the ampersand sets it as a bg process.
    ========================================================================
    BASH ======================================================================== PROGRAMMING variables=withnospaces variabless='more than one item'
    variablessss="if we want to use a variable inside quotes then use double quotes $variabless"
    arrays=(using parenthesis this is an array)
    access element as arrays[i]
    access arguments as a list $* or as a string $@
    access script name with $0
    define positional arguments on your script as echo $1 $2 $3
    example:

    myscript.sh
    echo $1 $2
    ./myscript.sh hi sr
    >> hi sr 


