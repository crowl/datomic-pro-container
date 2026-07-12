# Datomic Pro Container

Build and run a Datomic Pro transactor in an Alpine-based OCI container on
macOS using Apple's [`container`](https://github.com/apple/container) tool.

## Requirements

- A Mac with Apple silicon running a version of macOS supported by `container`
- `container` installed and its system service running:

  ```sh
  container system start
  ```

## Build and run

```sh
./build.sh
./run.sh
```

The Datomic version is set in `DATOMIC_VERSION`. The transactor runs in the
background as `datomic-pro`; follow its logs with:

```sh
container logs --follow datomic-pro
```

## Configuration

By default, `transactor.properties` configures Datomic's `dev` transactor with
embedded H2 storage. Port `4334` is used by peers to connect to the transactor,
and port `4335` exposes H2. Connect using:

```text
datomic:dev://localhost:4334/<database>?password=datomic
```

Data is stored in `./data`. Edit `transactor.properties` to configure any other
[storage backend supported by Datomic](https://docs.datomic.com/operation/storage.html).

## Stop and remove

```sh
container stop datomic-pro
container delete datomic-pro
```
