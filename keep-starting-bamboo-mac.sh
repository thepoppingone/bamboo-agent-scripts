#!/bin/bash
while true; do
        echo "Starting Bamboo Process Console - logs to /tmp"
        ./bamboo-agent.sh console >> /tmp/bamboo-osx-logs &
        BAMBOO_PID=$!
        tail -f /tmp/bamboo-osx-logs &
        TAIL_PID=$!
        echo "Tail PID is $TAIL_PID"
        echo "Bamboo PID is $BAMBOO_PID"
        wait $BAMBOO_PID
        kill -9 $TAIL_PID
        echo "Bamboo Console Process has Ended"
done
