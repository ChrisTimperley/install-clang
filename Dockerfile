FROM        ubuntu:trusty
MAINTAINER  Robin Sommer <robin@icir.org>

# Setup environment.
ENV PATH /opt/llvm/bin:$PATH

# Default command on startup.
CMD bash

# Setup packages.
RUN apt-get update && apt-get -y install cmake git build-essential python

# Copy install-clang over.
ADD . /opt/install-clang

# Compile and install LLVM/clang. We delete the source directory to
# avoid committing it to the image.
# CT: build from master, not 3.5 release
RUN /opt/install-clang/install-clang -m -j $(nproc) -C /opt/llvm
