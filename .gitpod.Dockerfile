FROM gitpod/workspace-full:latest

# Installa Flutter
RUN git clone https://github.com/flutter/flutter.git /home/gitpod/flutter -b stable
ENV PATH="/home/gitpod/flutter/bin:${PATH}"

# Configura Flutter per Android e Web
RUN flutter doctor
RUN flutter config --enable-web
RUN flutter precache

# Licenze Android (necessarie se vuoi build APK)
RUN yes | flutter doctor --android-licenses
