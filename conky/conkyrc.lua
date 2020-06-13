conky.config = {
             background = false,
             out_to_x = false,
             out_to_console = true,
             update_interval = 3,
             total_run_times = 0,
             user_spacer = "none"
}

conky.text = [[
${exec acpi -b | head -1 | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\3/'}% \
${exec acpi -b | head -1 | awk "{print $1}" | sed 's/\([^:]*\): \([^,]*\), \([0-9]*\)%.*/\2/'} \
${if_mpd_playing}${mpd_artist}${mpd_title}${endif}     \
   ${downspeedf wlp0s20f3} | ${upspeedf wlp0s20f3}     \
  ${wireless_link_qual wlp0s20f3}%  ${wireless_essid wlp0s20f3}     \
   ${hwmon 2 temp 1} | ${hwmon 2 temp 3}     \
  ${exec /home/ashish/.config/i3/conky/volume.sh}     \
  ${time %a %b %d}     \
⌛  ${time %H:%M}
]]