#!/bin/bash

export DISPLAY=:0

DELAY=10

MIN_TEMP=60

CARDS_NUM=`nvidia-smi -L | wc -l`
echo "Found ${CARDS_NUM} GPU(s), Delay ${DELAY}s"

while true
        do
            echo "$(date +"%d/%m/%y %T")"
        for ((i=0; i<$CARDS_NUM; i++))
            do
                
                GPU_TEMP=`nvidia-smi -i $i --query-gpu=temperature.gpu --format=csv,noheader`
				GPU_FUN=`nvidia-smi -i $i --query-gpu=fan.speed --format=csv,noheader,nounits`
				DIFF=$(( $GPU_TEMP - $MIN_TEMP ))
				echo "GPU${i} ${GPU_TEMP}°C -> ${GPU_FUN}%"
                if [ $DIFF -le -2 ]
                    then
                        FAN_SPEED=$(( $GPU_FUN - 2))

                elif [ $DIFF -ge 2 ]
                    then
						FAN_SPEED=$(( $GPU_FUN + 2))
                fi
				if [ $FAN_SPEED -gt 100 ]
				then
					FAN_SPEED=100
				fi
				
				nvidia-settings -a [gpu:$i]/GPUFanControlState=1 > /dev/null
                nvidia-settings -a [fan:$i]/GPUTargetFanSpeed=$FAN_SPEED > /dev/null
                echo "GPU${i} SET ${FAN_SPEED}%"
       done
sleep $DELAY
done
