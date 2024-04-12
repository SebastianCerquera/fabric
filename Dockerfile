FROM ubuntu:22.04
RUN apt-get update && apt-get install -y python3 python3-venv python3-pip git
RUN pip3 install pipx
RUN pip3 install youtube-transcript-api

RUN mkdir -p /root/sources
ADD . /root/sources
RUN cp /root/sources/entrypoint.sh /entrypoint.sh && chmod +x /entrypoint.sh

WORKDIR /root/sources
RUN pipx install . && update-alternatives --install /usr/bin/yt yt /root/.local/share/pipx/venvs/fabric/bin/yt 1000 && update-alternatives --install /usr/bin/fabric fabric /root/.local/share/pipx/venvs/fabric/bin/fabric 1000 && update-alternatives --install /usr/bin/fabric-webui fabric-webui /root/.local/share/pipx/venvs/fabric/bin/fabric-webui 1000

ENTRYPOINT ["/entrypoint.sh"]
