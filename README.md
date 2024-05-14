# Surveillance-camera
步驟1.幫樹莓派安裝作業系統
  >下載樹莓派映像檔:https://www.raspberrypi.com/software/operating-systems/  (這邊用的是桌面可以用滑鼠操作的請選Raspbian Buster with desktop)
  >把SD卡格式化為FAT32格式
  >用balenaEtcher工具把映像檔燒到SD卡中
  >將SD卡插入樹莓派，開機並跟著步驟完成安裝

步驟2.利用vnc遠端桌面操作樹莓派
  >樹莓派開機後至樹梅派設定裡開啟vnc功能
  >打開terminal打上"ifconfig"查看樹莓派ip位址
  >電腦端下載vnc viewer(用哪個裝置就下載哪個os):https://www.realvnc.com/en/connect/download/viewer/windows/
  >vnc viewer下載安裝好後打上查到的樹莓派ip位址即可遠端操作

步驟3.安裝motion
  >在樹莓派terminal打上"sudo apt-get install motion"(可先"sudo apt-get update、sudo apt-get upgrade")
  >接著安裝一些必要套件"sudo apt-get install libjpeg-dev gettext libmicrohttpd-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libavdevice-dev libwebp-dev mysql-common libmariadb3 libpq5"(若出現錯誤就下載提供的lib檔)

步驟4.調整motion設定
  >至"/etc/motion/motion.conf"改變參數設定
  >"sudo nano /etc/default/motion"編輯設定檔
  >"start_motion_daemon"參數改為on(可後臺執行)
>

步驟5.使motion偵測移動時發送及時通知至slack
  >slack開一個新的工作區

