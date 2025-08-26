
FROM gitpod/workspace-full:latest

# Installa tool necessari
RUN sudo apt-get update && \
    sudo apt-get install -y unzip curl git wget xz-utils zip libglu1-mesa libgtk-3-dev mesa-utils && \
    rm -rf /var/lib/apt/lists/*

# Scarica Flutter SDK stabile nella home
RUN git clone https://github.com/flutter/flutter.git /home/gitpod/flutter_sdk

# Imposta variabili d'ambiente per Flutter
ENV PATH="/home/gitpod/flutter_sdk/bin:/home/gitpod/flutter_sdk/bin/cache/dart-sdk/bin:${PATH}"

# Aggiorna Flutter al canale stabile
RUN /home/gitpod/flutter_sdk/bin/flutter channel stable && \
    /home/gitpod/flutter_sdk/bin/flutter upgrade && \
    /home/gitpod/flutter_sdk/bin/flutter doctor -v

# Crea cartella Android SDK e scarica command line tools
RUN mkdir -p /home/gitpod/Android/cmdline-tools && \
    curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip sdk-tools.zip -d /home/gitpod/Android/cmdline-tools && \
    mv /home/gitpod/Android/cmdline-tools/cmdline-tools /home/gitpod/Android/cmdline-tools/latest && \
    rm sdk-tools.zip

# Imposta variabili d'ambiente Android
ENV ANDROID_HOME=/home/gitpod/Android
ENV PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
