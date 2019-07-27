FROM alpine

ARG username="vimuser"
ARG userpass="vimuser"

# user
RUN adduser -S ${username} \
    && echo "${username} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "${username}:${userpass}" | chpasswd \
    && apk --update add vim git curl

# setup
USER ${username}
RUN cd ~ \
    && git clone https://github.com/canpok1/dotfiles.git \
    && cd dotfiles \
    && sh setup.sh \
    && vim -c "call dein#install()" -c "q"

