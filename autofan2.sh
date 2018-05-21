#!/bin/bash

#Nicehash donate: 3JKA47P98c9JGCy3GN7qXFC2FzeuJmXuph
#Zec donate: t1fP9jWyqFEni2p4i9t3byqtimsMKv1y95T
#ETH donate: 0xe835a7d5605a370e4750279b28f9ce0926061ea2

export DISPLAY=:0

DELAY=60

MAX_TEMP=65

CARDS_NUM=`nvidia-smi -L | wc -l`
echo "Found ${CARDS_NUM} GPU(s), Delay ${DELAY}s"

while true
        do
        echo "$(date +"%d/%m/%y %T")"
        for ((i=0; i<$CARDS_NUM; i++))
            do
                
                GPU_TEMP=`nvidia-smi -i $i --query-gpu=temperature.gpu --format=csv,noheader`
				GPU_FUN=`nvidia-smi -i $i --query-gpu=fan.speed --format=csv,noheader,nounits`
				DIFF=$(( $GPU_TEMP - $MAX_TEMP ))
				echo "GPU${i} ${GPU_TEMP}°C -> ${GPU_FUN}%"
                if [ $DIFF -le -2 ]
                    then
                        FAN_SPEED=$(( $GPU_FUN - 2))
						nvidia-settings -a [gpu:$i]/GPUFanControlState=1 > /dev/null
						nvidia-settings -a [fan:$i]/GPUTargetFanSpeed=$FAN_SPEED > /dev/null
						echo "GPU${i} SET ${FAN_SPEED}%"

                elif [ $DIFF -ge 2 ]
                    then
						FAN_SPEED=$(( $GPU_FUN + 2))
						if [ $FAN_SPEED -gt 100 ]
								then
									FAN_SPEED=100
						fi
						nvidia-settings -a [gpu:$i]/GPUFanControlState=1 > /dev/null
						nvidia-settings -a [fan:$i]/GPUTargetFanSpeed=$FAN_SPEED > /dev/null
						echo "GPU${i} SET ${FAN_SPEED}%"
                fi
				
				
				
       done
sleep $DELAY
done
