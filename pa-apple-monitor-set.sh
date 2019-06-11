# Find the apple audio sink.
default_sink=$(pacmd list-sinks  | grep 'name: <alsa_output.usb.*.Apple' -B 1 | grep index | sed -e 's/.*: //g' | tr -d '\n')

# Use it if found
if [ "$?" -eq "0" ]; then
    pacmd set-default-sink $default_sink
fi
