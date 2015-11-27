# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export JAVA_HOME='/usr/lib/jvm/default-runtime'
export EDITOR='mcedit'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

umask 000

