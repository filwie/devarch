FROM base/archlinux

ARG user="dev"


ARG basic_packages="sudo zsh gvim tmux git"
ARG programming_packages="make cmake gcc clang \
                          python python-pip tk tcl \
                          ansible \
                          go \
                          rust"
ARG utility_packages="ripgrep ranger grc unzip \
                      wget lynx mutt imagemagick \
                      htop iftop iotop reflector"

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
RUN locale-gen

RUN pacman -Sy --needed --noconfirm ${basic_packages} \
                                    ${programming_packages} \
                                    ${utility_packages}

RUN useradd --create-home --shell "$(which zsh)" "${user}" && \
    groupadd sudo && \
    usermod -a -G sudo "${user}" && \
    echo "%sudo  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER "${user}"

COPY home "/home/${user}"
WORKDIR /home/"${user}"
RUN .mini-dotfiles/install.sh

CMD ["zsh"]
