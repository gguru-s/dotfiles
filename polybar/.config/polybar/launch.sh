#!/bin/bash                                                                        
                                                                                   
# Terminate already running bars                                                   
killall -q polybar                                                                 
                                                                                   
# Launch new polybar(s)                                                            
if type "xrandr"; then                                                             
    IFS=$'\n'  # must set internal field separator to avoid dumb                   
    for entry in $(xrandr --query | grep " connected"); do                         
        mon=$(cut -d" " -f1 <<< "$entry")                                          
        status=$(cut -d" " -f3 <<< "$entry")                                       
                                                                                   
        tray_pos=""                                                                
        if [ "$status" == "primary" ]; then                                        
            tray_pos="right"                                                       
        fi 

        # Set the dpi of the monitor for each bar. HAve to figure out the i3 gaps border
        if [ "$mon" == "DP-2" ]; then
            dpi=100
        else
            dpi=100
        fi

        if [ "$mon" == "HDMI-0" ]; then
            tray_pos="right"
        else
            tray_pos=""
        fi
                                                                                   
        MONITOR=$mon TRAY_POS=$tray_pos DPI=$dpi polybar -r example 2>&1 | tee -a /tmp/polybar-monitor-"$mon".log & disown                                                     
    done                                                                           
    unset IFS  # avoid mega dumb by resetting the IFS                              
else                                                                               
    polybar -r example 2>&1 | tee -a /tmp/polybar.log & disown                      
fi                                                                                 

                                                                                   
echo "Polybar launched..."
