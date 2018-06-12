echo -e "  Aliases and special commands and options:"

alias engage1="play -q -n -c1 synth whitenoise band -n 100 20 band -n 50 20 gain +25  fade h 1 864000 1 &"
echo -e "\tEngines 1 set to engage on command 'engage1'"

alias engage2="sox -q -c 2 -r 32000 -n -d -D synth 12:00:00 brownnoise vol 0.2 tremolo 0.0625 50 fade t 5 &"
echo -e "\tEngines 2 set to engage on command 'engage2'"

alias engage3="play -q -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +14 &"
echo -e "\tEngines 3 set to engage on command 'engage3'"

alias volumeDown="amixer -D pulse sset Master 5%-"
echo -e "\tvolumeDown decreases engine throttle."

alias volumeUp="amixer -D pulse sset Master 5%+"
echo -e "\tvolumeUp increases engine throttle."

# bind magic space to expand commands
bind Space:magic-space
echo -e "\tBound space key to magic-expand commands."

# Additional git aliases
alias glg='git lg'
alias gb='git branch'
alias gst='git st'
alias gl='git pull'
alias gp='git push'
alias gau='git add -u'
echo "  GIT aliases:"
echo -e "\tglg='git lg'"
echo -e "\tgb='git branch'"
echo -e "\tgst='git st'"
echo -e "\tgl='git pull'"
echo -e "\tgp='git push'"
echo -e "\tgau='git add -u'"
