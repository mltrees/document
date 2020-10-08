open image: xdg-open $file
## firefox show icon:
    1.输入：cd /usr/share/applications
    2.输入：sudo vi firefox.desktop 
    在vi里面输入以下内容，然后保存并退出：
    [Desktop Entry] 
    Name=Firefox 6.0  
    Comment=this is firefox 
    Exec=/usr/lib/firefox/firefox 
    Icon=/usr/lib/firefox/icons/mozicon128.png 
    Terminal=false 
    Type=Application 
    Categories=Application;Network; 
18.04 壁纸美化: https://www.cnblogs.com/feipeng8848/p/8970556.html
raw https://raw.githubusercontent.com/vbay/CSDN-CODE/master/Ubuntu18.04-tutorials-themes/%E5%A3%81%E7%BA%B8/HighSierra-wallpapers.tar.xz

## 快捷键:
最大化: alt + 上箭头
显示桌面： win+D（需要设置）
最大化在左半面： win+左箭头
最大化在右半面： win+右箭头


## ubuntu install chrome
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt update
sudo apt install google-chrome-stable


## ubuntu修改PgUp至左箭头，PgDown至右键头，避免有些键位误按按错
* sudo vim /usr/share/X11/xkb/symbols/pc
* 找到 key<PGUP> 将Prior改为Left
* 找到 key<PGDN> 将Next改为Right
* 保存

## wbpy输入法取消４码自动上屏
* 进入　"input method configuration", select "WubiPinyin"
* 弹出的对话框选中 "table/wbpy.conf"选择下面的设置
* Auto Send Candidate Word 复选框取消．则后续都需要点击空格才能上屏
