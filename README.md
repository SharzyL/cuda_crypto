# CUDA Crypto

Some cuda kernels for crypto primitives.

## Usage

Ensure cuda toolkit and cudabench are installed. The project is tested with cuda 12.8.

```console
$ cmake -B build -DCMAKE_BUILD_TYPE=Release -GNinja
$ cmake --build build
$ ./build/mmm/mmm_bench
$ ./build/ntt/ntt_bench
```

For NixOS users the project can be directly built with nix

```console
$ nix build
$ ./result/mmm_bench
$ ./result/ntt_bench
```

To run nix-built binary on non-NixOS machines, find `libnvidia-ml.so.1` and `libcuda.so.1` of your cuda installation (must not be stub ones).

```consolej
$ fd libnvidia-ml /usr
```

Assuming these libraries are installed in `/usr/lib/x86_64-linux-gnu`. Then copy these files into a separate directory

```console
$ mkdir nvlibs && cp /usr/lib/x86_64-linux-gnu/{libcuda.so*,libnvidia-ml*} nvlibs
$ LD_LIBRARY_PATH=nvlibs ./result/bin/mmm_bench
$ LD_LIBRARY_PATH=nvlibs ./result/bin/ntt_bench
```
