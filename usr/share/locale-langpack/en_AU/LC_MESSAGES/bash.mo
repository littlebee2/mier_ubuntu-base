��          L      |       �   �  �   B  @  �  �  "  (  �  K$  �  �'  �  �)  B  e6  �  �=  "  NF  �  qM                                         Evaluate conditional expression.
    
    Exits with a status of 0 (true) or 1 (false) depending on
    the evaluation of EXPR.  Expressions may be unary or binary.  Unary
    expressions are often used to examine the status of a file.  There
    are string operators and numeric comparison operators as well.
    
    The behavior of test depends on the number of arguments.  Read the
    bash manual page for the complete specification.
    
    File operators:
    
      -a FILE        True if file exists.
      -b FILE        True if file is block special.
      -c FILE        True if file is character special.
      -d FILE        True if file is a directory.
      -e FILE        True if file exists.
      -f FILE        True if file exists and is a regular file.
      -g FILE        True if file is set-group-id.
      -h FILE        True if file is a symbolic link.
      -L FILE        True if file is a symbolic link.
      -k FILE        True if file has its `sticky' bit set.
      -p FILE        True if file is a named pipe.
      -r FILE        True if file is readable by you.
      -s FILE        True if file exists and is not empty.
      -S FILE        True if file is a socket.
      -t FD          True if FD is opened on a terminal.
      -u FILE        True if the file is set-user-id.
      -w FILE        True if the file is writable by you.
      -x FILE        True if the file is executable by you.
      -O FILE        True if the file is effectively owned by you.
      -G FILE        True if the file is effectively owned by your group.
      -N FILE        True if the file has been modified since it was last read.
    
      FILE1 -nt FILE2  True if file1 is newer than file2 (according to
                       modification date).
    
      FILE1 -ot FILE2  True if file1 is older than file2.
    
      FILE1 -ef FILE2  True if file1 is a hard link to file2.
    
    String operators:
    
      -z STRING      True if string is empty.
    
      -n STRING
         STRING      True if string is not empty.
    
      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.
    
    Other operators:
    
      -o OPTION      True if the shell option OPTION is enabled.
      -v VAR	 True if the shell variable VAR is set
      -R VAR	 True if the shell variable VAR is set and is a name reference.
      ! EXPR         True if expr is false.
      EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.
      EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.
    
      arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                     -lt, -le, -gt, or -ge.
    
    Arithmetic binary operators return true if ARG1 is equal, not-equal,
    less-than, less-than-or-equal, greater-than, or greater-than-or-equal
    than ARG2.
    
    Exit Status:
    Returns success if EXPR evaluates to true; fails if EXPR evaluates to
    false or an invalid argument is given. Parse option arguments.
    
    Getopts is used by shell procedures to parse positional parameters
    as options.
    
    OPTSTRING contains the option letters to be recognized; if a letter
    is followed by a colon, the option is expected to have an argument,
    which should be separated from it by white space.
    
    Each time it is invoked, getopts will place the next option in the
    shell variable $name, initializing name if it does not exist, and
    the index of the next argument to be processed into the shell
    variable OPTIND.  OPTIND is initialized to 1 each time the shell or
    a shell script is invoked.  When an option requires an argument,
    getopts places that argument into the shell variable OPTARG.
    
    getopts reports errors in one of two ways.  If the first character
    of OPTSTRING is a colon, getopts uses silent error reporting.  In
    this mode, no error messages are printed.  If an invalid option is
    seen, getopts places the option character found into OPTARG.  If a
    required argument is not found, getopts places a ':' into NAME and
    sets OPTARG to the option character found.  If getopts is not in
    silent mode, and an invalid option is seen, getopts places '?' into
    NAME and unsets OPTARG.  If a required argument is not found, a '?'
    is placed in NAME, OPTARG is unset, and a diagnostic message is
    printed.
    
    If the shell variable OPTERR has the value 0, getopts disables the
    printing of error messages, even if the first character of
    OPTSTRING is not a colon.  OPTERR has the value 1 by default.
    
    Getopts normally parses the positional parameters ($0 - $9), but if
    more arguments are given, they are parsed instead.
    
    Exit Status:
    Returns success if an option is found; fails if the end of options is
    encountered or an error occurs. Read a line from the standard input and split it into fields.
    
    Reads a single line from the standard input, or from file descriptor FD
    if the -u option is supplied.  The line is split into fields as with word
    splitting, and the first word is assigned to the first NAME, the second
    word to the second NAME, and so on, with any leftover words assigned to
    the last NAME.  Only the characters found in $IFS are recognized as word
    delimiters.
    
    If no NAMEs are supplied, the line read is stored in the REPLY variable.
    
    Options:
      -a array	assign the words read to sequential indices of the array
    		variable ARRAY, starting at zero
      -d delim	continue until the first character of DELIM is read, rather
    		than newline
      -e		use Readline to obtain the line in an interactive shell
      -i text	Use TEXT as the initial text for Readline
      -n nchars	return after reading NCHARS characters rather than waiting
    		for a newline, but honor a delimiter if fewer than NCHARS
    		characters are read before the delimiter
      -N nchars	return only after reading exactly NCHARS characters, unless
    		EOF is encountered or read times out, ignoring any delimiter
      -p prompt	output the string PROMPT without a trailing newline before
    		attempting to read
      -r		do not allow backslashes to escape any characters
      -s		do not echo input coming from a terminal
      -t timeout	time out and return failure if a complete line of input is
    		not read within TIMEOUT seconds.  The value of the TMOUT
    		variable is the default timeout.  TIMEOUT may be a
    		fractional number.  If TIMEOUT is 0, read returns immediately,
    		without trying to read any data, returning success only if
    		input is available on the specified file descriptor.  The
    		exit status is greater than 128 if the timeout is exceeded
      -u fd		read from file descriptor FD instead of the standard input
    
    Exit Status:
    The return code is zero, unless end-of-file is encountered, read times out
    (in which case it's greater than 128), a variable assignment error occurs,
    or an invalid file descriptor is supplied as the argument to -u. Set Readline key bindings and variables.
    
    Bind a key sequence to a Readline function or a macro, or set a
    Readline variable.  The non-option argument syntax is equivalent to
    that found in ~/.inputrc, but must be passed as a single argument:
    e.g., bind '"\C-x\C-r": re-read-init-file'.
    
    Options:
      -m  keymap         Use KEYMAP as the keymap for the duration of this
                         command.  Acceptable keymap names are emacs,
                         emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move,
                         vi-command, and vi-insert.
      -l                 List names of functions.
      -P                 List function names and bindings.
      -p                 List functions and bindings in a form that can be
                         reused as input.
      -S                 List key sequences that invoke macros and their values
      -s                 List key sequences that invoke macros and their values
                         in a form that can be reused as input.
      -V                 List variable names and values
      -v                 List variable names and values in a form that can
                         be reused as input.
      -q  function-name  Query about which keys invoke the named function.
      -u  function-name  Unbind all keys which are bound to the named function.
      -r  keyseq         Remove the binding for KEYSEQ.
      -f  filename       Read key bindings from FILENAME.
      -x  keyseq:shell-command	Cause SHELL-COMMAND to be executed when
    				KEYSEQ is entered.
      -X		     List key sequences bound with -x and associated commands
                         in a form that can be reused as input.
    
    Exit Status:
    bind returns 0 unless an unrecognized option is given or an error occurs. Write arguments to the standard output.
    
    Display the ARGs, separated by a single space character and followed by a
    newline, on the standard output.
    
    Options:
      -n	do not append a newline
      -e	enable interpretation of the following backslash escapes
      -E	explicitly suppress interpretation of backslash escapes
    
    `echo' interprets the following backslash-escaped characters:
      \a	alert (bell)
      \b	backspace
      \c	suppress further output
      \e	escape character
      \E	escape character
      \f	form feed
      \n	new line
      \r	carriage return
      \t	horizontal tab
      \v	vertical tab
      \\	backslash
      \0nnn	the character whose ASCII code is NNN (octal).  NNN can be
    	0 to 3 octal digits
      \xHH	the eight-bit character whose value is HH (hexadecimal).  HH
    	can be one or two hex digits
    
    Exit Status:
    Returns success unless a write error occurs. Project-Id-Version: bash
Report-Msgid-Bugs-To: FULL NAME <EMAIL@ADDRESS>
POT-Creation-Date: 2014-02-11 11:19-0500
PO-Revision-Date: 2015-05-20 12:23+0000
Last-Translator: Joel Addison <jaddi27@gmail.com>
Language-Team: English (Australia) <en_AU@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2016-06-27 15:59+0000
X-Generator: Launchpad (build 18115)
 Evaluate conditional expression.
    
    Exits with a status of 0 (true) or 1 (false) depending on
    the evaluation of EXPR.  Expressions may be unary or binary.  Unary
    expressions are often used to examine the status of a file.  There
    are string operators and numeric comparison operators as well.
    
    The behaviour of test depends on the number of arguments.  Read the
    bash manual page for the complete specification.
    
    File operators:
    
      -a FILE        True if file exists.
      -b FILE        True if file is block special.
      -c FILE        True if file is character special.
      -d FILE        True if file is a directory.
      -e FILE        True if file exists.
      -f FILE        True if file exists and is a regular file.
      -g FILE        True if file is set-group-id.
      -h FILE        True if file is a symbolic link.
      -L FILE        True if file is a symbolic link.
      -k FILE        True if file has its `sticky' bit set.
      -p FILE        True if file is a named pipe.
      -r FILE        True if file is readable by you.
      -s FILE        True if file exists and is not empty.
      -S FILE        True if file is a socket.
      -t FD          True if FD is opened on a terminal.
      -u FILE        True if the file is set-user-id.
      -w FILE        True if the file is writeable by you.
      -x FILE        True if the file is executable by you.
      -O FILE        True if the file is effectively owned by you.
      -G FILE        True if the file is effectively owned by your group.
      -N FILE        True if the file has been modified since it was last read.
    
      FILE1 -nt FILE2  True if file1 is newer than file2 (according to
                       modification date).
    
      FILE1 -ot FILE2  True if file1 is older than file2.
    
      FILE1 -ef FILE2  True if file1 is a hard link to file2.
    
    String operators:
    
      -z STRING      True if string is empty.
    
      -n STRING
         STRING      True if string is not empty.
    
      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.
    
    Other operators:
    
      -o OPTION      True if the shell option OPTION is enabled.
      -v VAR	 True if the shell variable VAR is set
      -R VAR	 True if the shell variable VAR is set and is a name reference.
      ! EXPR         True if expr is false.
      EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.
      EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.
    
      arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                     -lt, -le, -gt, or -ge.
    
    Arithmetic binary operators return true if ARG1 is equal, not-equal,
    less-than, less-than-or-equal, greater-than, or greater-than-or-equal
    than ARG2.
    
    Exit Status:
    Returns success if EXPR evaluates to true; fails if EXPR evaluates to
    false or an invalid argument is given. Parse option arguments.
    
    Getopts is used by shell procedures to parse positional parameters
    as options.
    
    OPTSTRING contains the option letters to be recognised; if a letter
    is followed by a colon, the option is expected to have an argument,
    which should be separated from it by white space.
    
    Each time it is invoked, getopts will place the next option in the
    shell variable $name, initializing name if it does not exist, and
    the index of the next argument to be processed into the shell
    variable OPTIND.  OPTIND is initialized to 1 each time the shell or
    a shell script is invoked.  When an option requires an argument,
    getopts places that argument into the shell variable OPTARG.
    
    getopts reports errors in one of two ways.  If the first character
    of OPTSTRING is a colon, getopts uses silent error reporting.  In
    this mode, no error messages are printed.  If an invalid option is
    seen, getopts places the option character found into OPTARG.  If a
    required argument is not found, getopts places a ':' into NAME and
    sets OPTARG to the option character found.  If getopts is not in
    silent mode, and an invalid option is seen, getopts places '?' into
    NAME and unsets OPTARG.  If a required argument is not found, a '?'
    is placed in NAME, OPTARG is unset, and a diagnostic message is
    printed.
    
    If the shell variable OPTERR has the value 0, getopts disables the
    printing of error messages, even if the first character of
    OPTSTRING is not a colon.  OPTERR has the value 1 by default.
    
    Getopts normally parses the positional parameters ($0 - $9), but if
    more arguments are given, they are parsed instead.
    
    Exit Status:
    Returns success if an option is found; fails if the end of options is
    encountered or an error occurs. Read a line from the standard input and split it into fields.
    
    Reads a single line from the standard input, or from file descriptor FD
    if the -u option is supplied.  The line is split into fields as with word
    splitting, and the first word is assigned to the first NAME, the second
    word to the second NAME, and so on, with any leftover words assigned to
    the last NAME.  Only the characters found in $IFS are recognised as word
    delimiters.
    
    If no NAMEs are supplied, the line read is stored in the REPLY variable.
    
    Options:
      -a array	assign the words read to sequential indices of the array
    		variable ARRAY, starting at zero
      -d delim	continue until the first character of DELIM is read, rather
    		than newline
      -e		use Readline to obtain the line in an interactive shell
      -i text	Use TEXT as the initial text for Readline
      -n nchars	return after reading NCHARS characters rather than waiting
    		for a newline, but honour a delimiter if fewer than NCHARS
    		characters are read before the delimiter
      -N nchars	return only after reading exactly NCHARS characters, unless
    		EOF is encountered or read times out, ignoring any delimiter
      -p prompt	output the string PROMPT without a trailing newline before
    		attempting to read
      -r		do not allow backslashes to escape any characters
      -s		do not echo input coming from a terminal
      -t timeout	time out and return failure if a complete line of input is
    		not read within TIMEOUT seconds.  The value of the TMOUT
    		variable is the default timeout.  TIMEOUT may be a
    		fractional number.  If TIMEOUT is 0, read returns immediately,
    		without trying to read any data, returning success only if
    		input is available on the specified file descriptor.  The
    		exit status is greater than 128 if the timeout is exceeded
      -u fd		read from file descriptor FD instead of the standard input
    
    Exit Status:
    The return code is zero, unless end-of-file is encountered, read times out
    (in which case it's greater than 128), a variable assignment error occurs,
    or an invalid file descriptor is supplied as the argument to -u. Set Readline key bindings and variables.
    
    Bind a key sequence to a Readline function or a macro, or set a
    Readline variable.  The non-option argument syntax is equivalent to
    that found in ~/.inputrc, but must be passed as a single argument:
    e.g., bind '"\C-x\C-r": re-read-init-file'.
    
    Options:
      -m  keymap         Use KEYMAP as the keymap for the duration of this
                         command.  Acceptable keymap names are emacs,
                         emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move,
                         vi-command, and vi-insert.
      -l                 List names of functions.
      -P                 List function names and bindings.
      -p                 List functions and bindings in a form that can be
                         reused as input.
      -S                 List key sequences that invoke macros and their values
      -s                 List key sequences that invoke macros and their values
                         in a form that can be reused as input.
      -V                 List variable names and values
      -v                 List variable names and values in a form that can
                         be reused as input.
      -q  function-name  Query about which keys invoke the named function.
      -u  function-name  Unbind all keys which are bound to the named function.
      -r  keyseq         Remove the binding for KEYSEQ.
      -f  filename       Read key bindings from FILENAME.
      -x  keyseq:shell-command	Cause SHELL-COMMAND to be executed when
    				KEYSEQ is entered.
      -X		     List key sequences bound with -x and associated commands
                         in a form that can be reused as input.
    
    Exit Status:
    bind returns 0 unless an unrecognised option is given or an error occurs. Write arguments to the standard output.
    
    Display the ARGs, separated by a single space character and followed by a
    newline, on the standard output.
    
    Options:
      -n	do not append a newline
      -e	enable interpretation of the following backslash escapes
      -E	explicitly suppress interpretation of backslash escapes
    
    `echo' interprets the following backslash-escaped characters:
      \a	alert (bell)
      \b	backspace
      \c	suppress further output
      \e	escape character
      \E	escape character
      \f	form feed
      \n	new line
      \r	carriage return
      \t	horizontal tab
      \v	vertical tab
      \[tab]backslash
      \0nnn	the character whose ASCII code is NNN (octal).  NNN can be
    	0 to 3 octal digits
      \xHH	the eight-bit character whose value is HH (hexadecimal).  HH
    	can be one or two hex digits
    
    Exit Status:
    Returns success unless a write error occurs. 