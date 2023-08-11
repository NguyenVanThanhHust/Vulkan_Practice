# Installation
```
docker build -t vulkan_img -f Dockerfile --network=host .
```

```
docker run -it --name vulkan_ctn \
    --gpus=all \
    --shm-size 8G \
    --network host \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$PWD:/workspace/" \
    --volume=/usr/lib/x86_64-linux-gnu/libnvcuvid.so:/usr/lib/x86_64-linux-gnu/libnvcuvid.so.1 \
    --volume=/usr/lib/x86_64-linux-gnu/libnvcuvid.so:/usr/lib/x86_64-linux-gnu/libnvcuvid.so \
    --volume=/usr/lib/x86_64-linux-gnu/libnvidia-encode.so:/usr/lib/x86_64-linux-gnu/libnvidia-encode.so \
    vulkan_img:latest /bin/bash
```