
# 内网通过nginx代理访问百度地图

创建镜像：
```
docker build -t nginx:baiduMap .
```

启动容器：
```
docker run -itd -p 10086:10086 --name baiduMap nginx:baiduMap /bin/bash
```

进入容器：
```
docker exec -it baiduMap /bin/bash
```