###
python3 -m pip install --user -e ./python
### install python-virtualenv
apt install python3-virtualenv

### help
check function: help(nd.ones_like)
### fix error missing module d2l
pip install d2l


### error fix
1. 调用d2l.plot无法生成图形: 最后增加 d2l.plt.show() 或plt.show(),原因是Jupiter notebook不需要加,但是python客户端需要加
