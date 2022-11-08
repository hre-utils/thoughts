#!/bin/bash
# vim:ft=bash:foldmethod=marker:foldlevel=0

exit 0
# Don't actually run this! It's for notes during the talk.

# Quoting variables. {{{
# Unquoted variables may
#  1. Glob match unintended files/direcotries
#  2. Expand to multiple words
#--

path='/Application Support/foo'
mkdir $path

string="D*"
echo $string

#}}}

# Lack of comments. {{{
# Bash syntax can be convoluted. Use comments *more* than you would in another
# language.

# You see this line in a file. What does it do?
ARRAY=("${ARRAY[@]::${#ARRAY[@]}-1}")

#}}}

# Use of legacy test & command substitution. {{{
# Don't use single brackets or backticks.

path=~/foo/bar

# These are low-key deprecated
if test -f "$path" ; then echo 'yes!' ; done
if [ -f "$path" ]  ; then echo 'yes!' ; done

# Use this instead
if [[ -f "$path" ]] ; then echo 'yes!' ; done

# Formatting.
if [[ $var1 == cond1 &&
      $var2 == cond2 &&
      $var3 == cond3 ]]
then
   echo 'yay'
fi

# Regex.
if [[ $var =~ ^path$ ]] ; then
   # Capture group 1
   echo "${BASH_REMATCH[1]}"
fi

# Don't use this.
output=`foo --arg1 --arg2`

# Do use this
output=$( foo --arg1 --arg2 )

#}}}

# Lack of native arithmetic. {{{
# Simplifies loops, integer arithmetic and assignment.

declare -i int=0
(( idx++ ))

(( a=0, b=a+1 ))

# C-style loops.
for (( idx=0; idx<10; ++idx )) ; do
   echo "$idx"
done

# As a conditional.
while (( idx<10 )) ; do
   echo "$idx"
   (( ++idx ))
done

# Consideration:
(( 0 ))   #-> rv 1
(( 1 ))   #-> rv 0
# Can cause some surprising oopsies.

#}}}
