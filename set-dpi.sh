

#!/bin/bash

dpi=96
if xrandr | grep HDMI; then
  dpi=120
fi

CONF_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/xsettingsd"
mkdir -p "$CONF_DIR"

# Build xsettingsd.local
{
    cat $CONF_DIR/xsettingsd.conf 2>/dev/null || true
    echo Xft/DPI $(( $dpi*1024 ))
    echo Gdk/WindowScalingFactor $(( $dpi/96 ))
    echo Gdk/UnscaledDPI $(( $dpi*1024/($dpi/96) ))
} > $CONF_DIR/xsettingsd.local

pid=$(xprop -name xsettingsd _NET_WM_PID 2> /dev/null | awk '{print $NF}')
if [ -z "$pid" ]; then
    xsettingsd -c $CONF_DIR/xsettingsd.local &
else
    kill -HUP $pid
fi

echo Xft.dpi: $dpi | xrdb -merge
xrandr --dpi $dpi
