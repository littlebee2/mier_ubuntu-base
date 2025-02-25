��          T      �       �   0   �   �  �   B  �  �    "  �  �  �  �  �!  4   x#  �  �#  B  �)  �  �0  "  9  �  �@                                        %s: nameref variable self references not allowed Evaluate arithmetic expressions.
    
    Evaluate each ARG as an arithmetic expression.  Evaluation is done in
    fixed-width integers with no check for overflow, though division by 0
    is trapped and flagged as an error.  The following list of operators is
    grouped into levels of equal-precedence operators.  The levels are listed
    in order of decreasing precedence.
    
    	id++, id--	variable post-increment, post-decrement
    	++id, --id	variable pre-increment, pre-decrement
    	-, +		unary minus, plus
    	!, ~		logical and bitwise negation
    	**		exponentiation
    	*, /, %		multiplication, division, remainder
    	+, -		addition, subtraction
    	<<, >>		left and right bitwise shifts
    	<=, >=, <, >	comparison
    	==, !=		equality, inequality
    	&		bitwise AND
    	^		bitwise XOR
    	|		bitwise OR
    	&&		logical AND
    	||		logical OR
    	expr ? expr : expr
    			conditional operator
    	=, *=, /=, %=,
    	+=, -=, <<=, >>=,
    	&=, ^=, |=	assignment
    
    Shell variables are allowed as operands.  The name of the variable
    is replaced by its value (coerced to a fixed-width integer) within
    an expression.  The variable need not have its integer attribute
    turned on to be used in an expression.
    
    Operators are evaluated in order of precedence.  Sub-expressions in
    parentheses are evaluated first and may override the precedence
    rules above.
    
    Exit Status:
    If the last ARG evaluates to 0, let returns 1; let returns 0 otherwise. Parse option arguments.
    
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
PO-Revision-Date: 2014-08-30 02:43+0000
Last-Translator: Anthony Harrington <untaintableangel@ubuntu.com>
Language-Team: English (United Kingdom) <en_GB@li.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Launchpad-Export-Date: 2016-06-27 15:59+0000
X-Generator: Launchpad (build 18115)
 %s: nameref variable self references are not allowed Evaluate arithmetic expressions.
    
    Evaluate each ARG as an arithmetic expression.  Evaluation is done in
    fixed-width integers with no check for overflow, though division by 0
    is trapped and flagged as an error.  The following list of operators is
    grouped into levels of equal-precedence operators.  The levels are listed
    in order of decreasing precedence.
    
    	id++, id--	variable post-increment, post-decrement
    	++id, --id	variable pre-increment, pre-decrement
    	-, +		unary minus, plus
    	!, ~		logical and bitwise negation
    	**		exponentiation
    	*, /, %		multiplication, division, remainder
    	+, -		addition, subtraction
    	<<, >>		left and right bitwise shifts
    	<=, >=, <, >	comparison
    	==, !=		equality, inequality
    	&		bitwise AND
    	^		bitwise XOR
    	|		bitwise OR
    	&&		logical AND
    	||		logical OR
    	expr ? expr : expr
    			conditional operator
    	=, *=, /=, %=,
    	+=, -=, <<=, >>=,
    	&=, ^=, |=	assignment
    
    Shell variables are allowed as operands.  The name of the variable
    is replaced by its value (coerced to a fixed-width integer) within
    an expression.  The variable need not have its integer attribute
    turned on to be used in an expression.
    
    Operators are evaluated in order of precedence.  Sub-expressions in
    brackets are evaluated first and may override the precedence
    rules above.
    
    Exit Status:
    If the last ARG evaluates to 0, let returns 1; let returns 0 otherwise. Parse option arguments.
    
    Getopts is used by shell procedures to parse positional parameters
    as options.
    
    OPTSTRING contains the option letters to be recognised; if a letter
    is followed by a colon, the option is expected to have an argument,
    which should be separated from it by white space.
    
    Each time it is invoked, getopts will place the next option in the
    shell variable $name, initialising name if it does not exist, and
    the index of the next argument to be processed into the shell
    variable OPTIND.  OPTIND is initialised to 1 each time the shell or
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