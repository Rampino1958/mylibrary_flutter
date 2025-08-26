
FROM gitpod/workspace-full:latest

# Installa tool necessari (senza sudo)
RUN apt-get update && \
    apt-get install -y unzip curl git wget xz-utils zip libglu1-mesa libgtk-3-dev mesa-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* || true

# Scarica Flutter SDK stabile (cartella utente gitpod)
RUN curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.0-stable.tar.xz && \
    tar xf flutter_linux_3.24.0-stable.tar.xz && \
    mv flutter /home/gitpod/flutter_sdk && \
    rm flutter_linux_3.24.0-stable.tar.xz

# Scarica Android SDK command line tools
RUN mkdir -p /home/gitpod/Android/cmdline-tools && \
    curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip sdk-tools.zip -d /home/gitpod/Android/cmdline-tools && \
    mv /home/gitpod/Android/cmdline-tools/cmdline-tools /home/gitpod/Android/cmdline-tools/latest && \
    rm sdk-tools.zip

# Variabili d'ambiente
ENV ANDROID_HOME=/home/gitpod/Android
ENV PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:/home/gitpod/flutter_sdk/bin:/home/gitpod/flutter_sdk/bin/cache/dart-sdk/bin:$PATH

# Aggiorna Flutter al canale stabile
RUN /home/gitpod/flutter_sdk/bin/flutter channel stable && \
    /home/gitpod/flutter_sdk/bin/flutter upgrade && \
    /home/gitpod/flutter_sdk/bin/flutter doctor -v
