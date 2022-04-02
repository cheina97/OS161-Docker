FROM ubuntu:18.04

COPY ./install.sh ./install.sh
RUN chmod 777 install.sh
RUN ./install.sh
RUN rm install.sh

USER os161user

COPY --chown=os161user ./preliminary.sh ./preliminary.sh
RUN chmod 777 preliminary.sh
RUN ./preliminary.sh

WORKDIR /home/os161user/os161

COPY --chown=os161user ./binutils.sh ./binutils.sh
RUN chmod 777 binutils.sh
RUN ./binutils.sh

COPY --chown=os161user ./gcc.sh ./gcc.sh
RUN chmod 777 gcc.sh
RUN ./gcc.sh

COPY --chown=os161user ./gdb-7.8+os161-2.1 ./gdb-7.8+os161-2.1
COPY --chown=os161user ./gdb.sh ./gdb.sh
RUN chmod 777 gdb.sh
RUN ./gdb.sh

COPY --chown=os161user ./sys161-2.0.8 ./sys161-2.0.8
COPY --chown=os161user ./system161.sh ./system161.sh
RUN chmod 777 system161.sh
RUN ./system161.sh

COPY --chown=os161user ./generate-symlinks.sh ./generate-symlinks.sh
RUN chmod 777 generate-symlinks.sh
RUN ./generate-symlinks.sh

COPY --chown=os161user ./os161-base.sh ./os161-base.sh
RUN chmod 777 os161-base.sh
RUN ./os161-base.sh

COPY --chown=os161user ./os161-base.sh ./os161-base.sh
RUN chmod 777 os161-base.sh
RUN ./os161-base.sh

COPY --chown=os161user ./first-build.sh ./first-build.sh
RUN chmod 777 first-build.sh
RUN ./first-build.sh

COPY --chown=os161user ./.gdbinit /home/os161user/os161/root
RUN echo 'set auto-load safe-path /' > /home/os161user/.gdbinit
