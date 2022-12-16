# Building
[OpenRANGym tutorial](https://openrangym.com/tutorials/ns-o-ran)

Some implementations of SCTP have an issue when the port is exported. `setup-ric-bronze.sh` exports sctp ports by default, but running `setup-ric-braonze.sh arena` will turn it off, and the experiment will work. See [this github issue](https://github.com/docker/for-linux/issues/772) and [this other one](https://github.com/docker/for-linux/issues/784).

## Preparing
~~~
git submodule update --init --recursive
~~~

## Podman
~~~
podman build -t ns3-e2 .
~~~

Docker is similar.
~~~
docker built -t ns3-e2 -f Containerfile .
~~~

## Running the experiment
In the [OpenRANGym tutorial](https://openrangym.com/tutorials/ns-o-ran), we start a sample xApp. Once the xApp is started, we can start the `ns3-e2` container with
~~~
docker run -it --rm ns3-e2
cd /ns3/
./waf --run scratch/scenario-zero.cc
~~~
