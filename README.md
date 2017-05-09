# ch (Change Home)

## User Story

某一天，我在做一個逆向工程分析，結束後留下許多垃圾代碼和抓下來的工具軟體，想著以後都不會再用到了而一個一個刪掉他們，這時候我在想如果有一個工具可以隔離這些檔案就好了，於是我就自幹了一個...

## Introduction

因為我很懶惰，操作Terminal喜歡切到家目錄做任何事情，久而久之在家目錄堆積了一堆檔案。這個工具幫我建立一個虛擬的家目錄，然後我就眼不見為淨了！！！

程式還會幫你把所有在家目錄的隱藏檔例如`.vimrc .bashrc .zshrc .tmux.info`全都複製進去，所以Terminal Tools的設定仍會是正常的

除非你在設定檔裡面用到`~`，lmao

複製操作使用`rsync` 參數`-auq`

## Installation

記住在過程中不要用到`~`作為你的位置，因為在程式執行後會代換掉`~`的實際位置

目前支援`bash`和`zsh`，因為我只用這兩個

1. 下載本程式 `git clone https://github.com/xnum/ch.git`
2. `cd ch && chmod +x *.sh && ./install.sh`
3. 重開shell `$ ch`

## Usage

`$ chh new test` 新建一個`test`環境

`$ chh load test` 載入`test`環境 把家目錄切換過去

`$ chh exit` 離開它 回到你溫暖的家

## TODO

- [ ] 不使用rsync強制覆蓋，用hard link節省空間
- [ ] 看起來超專業的Usage和Error message
