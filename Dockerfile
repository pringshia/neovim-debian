FROM debian:stable-slim AS builder

RUN apt update && apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
RUN apt update && apt-get install -y git
RUN git clone --depth 1 https://github.com/neovim/neovim neovim

WORKDIR neovim

RUN make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/
RUN make install

FROM debian:stable-slim AS runner
RUN apt update && apt-get install -y git
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
COPY --from=builder /usr/bin/nvim /usr/bin
COPY --from=builder /usr/share/nvim/runtime /usr/share/nvim/runtime

RUN mkdir -p  /tmp/.config/nvim
RUN mkdir -p $HOME/.config/nvim
COPY .config/nvim/ /tmp/.config/nvim/
RUN cp -R /tmp/.config/nvim $HOME/.config/

COPY entrypoint.sh /tmp/entrypoint.sh

# ENTRYPOINT bash -ic /tmp/entrypoint.sh && bash 
ENTRYPOINT bash /tmp/entrypoint.sh && bash
