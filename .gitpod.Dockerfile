FROM gitpod/workspace-full

# Installazioni extra (se servono)
RUN sudo apt-get update && \
    sudo apt-get install -y unzip xz-utils zip libglu1-mesa
