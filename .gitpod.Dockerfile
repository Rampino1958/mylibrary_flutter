FROM gitpod/workspace-full:latest

# Installa tool necessari
RUN sudo apt-get update &&     sudo apt-get install -y unzip curl git wget

# Scarica Flutter SDK stabile
RUN curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.0-stable.tar.xz &&     tar xf flutter_linux_3.24.0-stable.tar.xz &&     mv flutter /home/gitpod/flutter

# Crea cartella Android SDK
RUN mkdir -p /home/gitpod/Android/cmdline-tools

# Scarica Android SDK command line tools
RUN curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip &&     unzip sdk-tools.zip -d /home/gitpod/Android/cmdline-tools &&     mv /home/gitpod/Android/cmdline-tools/cmdline-tools /home/gitpod/Android/cmdline-tools/latest

# Imposta variabili d'ambiente
ENV ANDROID_HOME=/home/gitpod/Android
ENV PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
