FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04
MAINTAINER My Games <mygames.g143@gmail.com>
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y 0ad --no-install-recommends
RUN useradd -ms /bin/bash apps
USER apps
#CMD ["/usr/games/0ad"]
CMD ["/bin/bash"]
