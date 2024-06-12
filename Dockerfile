FROM gcc:latest as build

WORKDIR /gtest_build
RUN apt-get update && \
  apt-get install -y \
    libgtest-dev \
    cmake \
  && \
  cmake -DCMAKE_BUILD_TYPE=Release /usr/src/gtest && \
  cmake --build .

ADD ./src /app/src
WORKDIR /app/build

RUN cmake ../src && \
  cmake --build . && \
  CTEST_OUTPUT_ON_FAILURE=TRUE cmake --build . --target test

FROM ubuntu:latest
WORKDIR /app
COPY --from=build /app/build/try_gtests .
ENTRYPOINT ["./try_gtests"]
