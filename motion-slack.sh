#監視 Motion log file，當發現其中有包含 "event_newfile" 的行時，將該行內容發送到 Slack 頻道中。
#USERNAME自行定義
#CHANNEL為工作區中指定頻道
#send_slack_message，用於發送消息到 Slack。
#執行後先發送一條消息"motion alert started!"到 Slack。
#使用 tail -n0 -F "${LOG_FILE}" 命令來監視 Motion 日志文件，其中 -n0 表示從文件末尾開始，-F 表示跟蹤文件的變化，以便實時獲取新添加的內容。

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
