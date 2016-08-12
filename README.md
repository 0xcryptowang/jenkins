jenkins docker build
=================

## 主要解决在docker容器中运行jenkins做CI／CD问题:
 * 需要在容器中能够执行docker命令，常用方法有２种(本例是第２种):

```
    1.打包docker到镜像中
    2.将jenkins用户添加加到docker用户组(jenkins官方镜像用户不在docker用户组),容器内通过和宿主机通信执行docker
```

 * 需要在容器中执行maven
 
 ```
     直接打包maven到镜像中
 ```

## 直接拉取镜像运行(镜像地址:)
 ```
     docker run -d --privileged  --name jenkins  -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 -p 50000:50000 gradle/jenkins 
 ```