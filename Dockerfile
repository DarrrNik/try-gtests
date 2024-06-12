FROM gcc:latest as builder

WORKDIR /gtest_build
RUN apt-get update && \
  apt-get install -y \
    cmake \
  && \
  cmake -DCMAKE_BUILD_TYPE=Release /usr/src/gtest && \
  cmake --build .
  
RUN git clone https://github.com/DarrrNik/try-gtests /try_gtests

WORKDIR /try_gtests/build

RUN cmake ../ && \
  cmake --build . && \
  CTEST_OUTPUT_ON_FAILURE=TRUE cmake --build . --target test

FROM ubuntu:latest
WORKDIR /
COPY --from=builder /build/try_gtests .
ENTRYPOINT ["./try_gtests"]

