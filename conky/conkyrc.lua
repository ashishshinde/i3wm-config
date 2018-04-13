conky.config = {
             background = false,
             out_to_x = false,
             out_to_console = true,
             update_interval = 3,
             total_run_times = 0,
             user_spacer = "none"
}

conky.text = [[
${exec acpi -b | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\3/'}% \
${exec acpi -b | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\2/'} \
${if_mpd_playing}${mpd_artist}${mpd_title}${endif}     \
   ${downspeedf wlp3s0} | ${upspeedf wlp3s0}     \
  ${wireless_link_qual wlp3s0}%  ${wireless_essid wlp3s0}     \
   ${hwmon 2 temp 1} | ${hwmon 2 temp 3}     \
  ${exec amixer get Master -c 0 -M | grep -oE "\[\[:digit:\]\]*%"}     \
  ${time %a %b %d}     \
⌛  ${time %H:%M}
]]