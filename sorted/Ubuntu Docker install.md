# Ubuntu Docker 安装

Docker Engine-Community 支持以下的 Ubuntu 版本：

* Xenial 16.04 (LTS)
*  Bionic 18.04 (LTS)
*  Cosmic 18.10
*  Disco 19.04

Docker Engine - Community 支持上 x86_64（或 amd64）armhf，arm64，s390x （IBM Z），和 ppc64le（IBM的Power）架构。

# 卸载旧版本

Docker 的旧版本被称为 docker，docker.io 或 docker-engine 。如果已安装，请卸载它们：

``` shell
$ sudo apt-get remove docker docker-engine docker.io containerd runc
```

当前称为 Docker Engine-Community 软件包 docker-ce 。

## 使用 Docker 仓库进行安装

在新主机上首次安装 Docker Engine-Community 之前，需要设置 Docker 仓库。之后，您可以从仓库安装和更新 Docker 。

### 设置仓库

更新 apt 包索引。

```shell
$ sudo apt-get update
```

安装 apt 依赖包，用于通过HTTPS来获取仓库:

```shell
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

​	添加 Docker 的官方 GPG 密钥：

```shell
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 通过搜索指纹的后8个字符，验证您现在是否拥有带有指纹的密钥。

```shell
$ sudo apt-key fingerprint 0EBFCD88
   
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

使用以下指令设置稳定版仓库

```shell
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
```

### 安装 Docker Engine-Community

更新 apt 包索引。

```
$ sudo apt-get update
```

安装最新版本的 Docker Engine-Community 和 containerd ，或者转到下一步安装特定版本：

```
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

要安装特定版本的 Docker Engine-Community，请在仓库中列出可用版本，然后选择一种安装。列出您的仓库中可用的版本：

 $ **apt-cache** madison docker-ce
 
  docker-ce **|** 5:18.09.1~3-0~ubuntu-xenial **|** https:**//**download.docker.com**/**linux**/**ubuntu  xenial**/**stable amd64 Packages
  docker-ce **|** 5:18.09.0~3-0~ubuntu-xenial **|** https:**//**download.docker.com**/**linux**/**ubuntu  xenial**/**stable amd64 Packages
  docker-ce **|** 18.06.1~ce~3-0~ubuntu    **|** https:**//**download.docker.com**/**linux**/**ubuntu  xenial**/**stable amd64 Packages
  docker-ce **|** 18.06.0~ce~3-0~ubuntu    **|** https:**//**download.docker.com**/**linux**/**ubuntu  xenial**/**stable amd64 Packages
  ...
 

使用第二列中的版本字符串安装特定版本，例如 5:18.09.1~3-0~ubuntu-xenial。

```
$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
```

测试 Docker 是否安装成功，输入以下指令，打印出以下信息则安装成功:

```shell
$ **sudo** docker run hello-world

 Unable to **find** image 'hello-world:latest' locally
 latest: Pulling from library**/**hello-world
 1b930d010525: Pull **complete**                                                                   Digest:  sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f
 Status: Downloaded newer image **for** hello-world:latest


 Hello from Docker**!**
 This message shows that your installation appears to be working correctly.


 To generate this message, Docker took the following steps:
 \1. The Docker client contacted the Docker daemon.
 \2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
   **(**amd64**)**
 \3. The Docker daemon created a new container from that image **which** runs the
   executable that produces the output you are currently reading.
 \4. The Docker daemon streamed that output to the Docker client, **which** sent it
   to your terminal.


 To try something **more** ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu **bash**xxxxxxxxxx $ **sudo** docker run hello-world Unable to **find** image 'hello-world:latest' locally latest: Pulling from library**/**hello-world 1b930d010525: Pull **complete**                                                                   Digest:  sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f Status: Downloaded newer image **for** hello-world:latest Hello from Docker**!** This message shows that your installation appears to be working correctly. To generate this message, Docker took the following steps: \1. The Docker client contacted the Docker daemon. \2. The Docker daemon pulled the "hello-world" image from the Docker Hub.   **(**amd64**)** \3. The Docker daemon created a new container from that image **which** runs the   executable that produces the output you are currently reading. \4. The Docker daemon streamed that output to the Docker client, **which** sent it   to your terminal. To try something **more** ambitious, you can run an Ubuntu container with: $ docker run -it ubuntu **bash**shell
  Share images, automate workflows, and **more** with a **free** Docker ID:
 https:**//**hub.docker.com**/**


 For **more** examples and ideas, visit:
 https:**//**docs.docker.com**/**get-started**/**
```



 from: https://www.runoob.com/docker/ubuntu-docker-install.html




