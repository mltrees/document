macOS 自带一个 ctags，但是不支持 -R 参数，递归产生tags文件

```
    $ ctags -R --exclude=.git --exclude=log *
    ctags: illegal option -- R
    usage: ctags [-BFadtuwvx] [-f tagsfile] file ...
```
使用Homebrew安装
```
brew install ctags
```
替换默认 ctags
```
    $ echo 'alias ctags="`brew --prefix`/bin/ctags"' >> $HOME/.zshrc
    $ exec $SHELL
```
bash 用户加入 $HOME/.bashrc，测试：
```
    $ ctags -R --exclude=.git --exclude=log *
```

