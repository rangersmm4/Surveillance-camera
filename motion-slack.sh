#當從montion的log file裡讀到"event_newfile"時傳送通知至slack
#USERNAME自行定義
#CHANNEL為工作區中指定頻道


#!/bin/bash
set -e
LOG_FILE='/var/log/motion/motion.log'
WEBHOOK_URL='https://hooks.slack.com/services/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'
USERNAME='motion'
CHANNEL='#motion-detect'

function send_slack_message {
  DATA="payload={\"username\": \"${USERNAME}\", \"channel\": \"${CHANNEL}\", \"text\": \"$1\"}"
  echo "data: ${DATA}"
  curl -X POST --data-urlencode "${DATA}" "${WEBHOOK_URL}";
  echo ""
}

send_slack_message 'motion alert started!'

tail -n0 -F "${LOG_FILE}" | while read LINE; do
  if [[ $LINE == *"event_newfile"* ]]; then
    send_slack_message "motion detected!"
  fi

done
