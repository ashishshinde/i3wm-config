conky.config = {
             background = false,
             out_to_x = false,
             out_to_console = true,
             update_interval = 3,
             total_run_times = 0,
             user_spacer = "none",
}

conky.text = [[
${exec acpi -b | head -1 | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\3/'}% \
${exec acpi -b | head -1 | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\2/'} \
${if_mpd_playing}${mpd_artist}${mpd_title}${endif}     \
   ${downspeedf wlo1} | ${upspeedf wlo1}     \
${color #FFFFFF}${color} ${wireless_link_qual wlo1}%  ${wireless_essid wlo1}     \
   ${hwmon 2 temp 1} | ${hwmon 2 temp 3}     \
  ${exec /usr/bin/pamixer --get-volume}     \
  ${time %a %b %d}     \
⌛  ${time %H:%M}  |
]]
