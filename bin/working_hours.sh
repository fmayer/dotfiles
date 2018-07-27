#!/bin/bash
hr=$(date +%_H)
color=""
if [[ $hr -lt 9 ]] || [[ $hr -gt 18 ]]; then
  echo "<span color='red'>$(date +%H:%M)</span>"
else
  date +%H:%M
fi
