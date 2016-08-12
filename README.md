jenkins docker build（ubuntu V16.04.1 docker V1.12.0 maven V3.3.3）
=================

## 主要解决在docker容器中运行jenkins做CI／CD的问题:
 * 需要在容器中能够执行docker命令(docker in docker问题)，常用方法有２种(本例是第２种):

    1.直接打包docker到镜像中,或者用jenkins镜像启动容器后，进入容器手工安装docker  
    
    2.将jenkins用户添加加到docker用户组(jenkins官方镜像用户不在docker用户组),容器内通过和宿主机通信执行docker


 * 需要在容器中执行maven
 
    直接打包maven到镜像中


## 编译镜像(中间下载maven的过程耐心等待)
```
docker build -t gradle/jenkins .
```

## 执行镜像运行（不想编译镜像也可以直接仓库拉取，拉取命令：）
```
docker run -d --privileged  --name jenkins  -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -p 8080:8080 -p 50000:50000 gradle/jenkins 
```