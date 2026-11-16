# Docker Environment – Lab 02

## 1. Overview

This laboratory uses custom Docker images to run Linux-based network nodes in GNS3.

Three images contain FRRouting 10.5.1 for OSPFv3 routing, while three additional images provide IPv6-enabled hosts and the simulated external ISP network.

## 2. Docker Images

| Docker Image | Role |
|---|---|
| ubuntu-frr:r1-final | R1 – Subnet Router |
| ubuntu-frr:r2-final | R2 – Core Router |
| ubuntu-frr:r4-final | R4 – Edge Router / ASBR |
| ubuntu-ipv6:h1-final | Host-1 |
| ubuntu-ipv6:h2-final | Host-2 |
| ubuntu-ipv6:isp-final | ISP-LAB |

## 3. Network Software

- Ubuntu-based Docker images
- FRRouting 10.5.1
- FRR daemons: Zebra, OSPFv3 (ospf6d) and Static Routing
- Linux IPv6 networking utilities
- Bash startup scripts

## 4. Configuration Persistence

The laboratory startup script `configure-ipv6.sh` is preserved in all six final Docker images.

It configures:
- IPv6 interface addressing
- Interface activation
- IPv6 forwarding on routers
- Default gateways on end hosts
- Static return routes on ISP-LAB

FRRouting configurations are maintained separately in the configurations directory.

## 5. Docker Image Export

The six custom Docker images were exported into a compressed archive using Docker save and gzip.

```bash
docker save \
  ubuntu-frr:r1-final \
  ubuntu-frr:r2-final \
  ubuntu-frr:r4-final \
  ubuntu-ipv6:h1-final \
  ubuntu-ipv6:h2-final \
  ubuntu-ipv6:isp-final \
  | gzip > dynamic-ipv6-docker-images.tar.gz
```

## 6. Docker Image Import

To restore the images:

```bash
gzip -dc dynamic-ipv6-docker-images.tar.gz | docker load
```

Verify the imported images:

```bash
docker images
```

## 7. Archive Validation

Check the integrity of the compressed archive:

```bash
gzip -t dynamic-ipv6-docker-images.tar.gz
```

## 8. Project Reproducibility

The Docker images are intended to be used together with the exported GNS3 project and the corresponding configuration files.

Required resources:
- GNS3 project export
- Six custom Docker images
- FRRouting configuration files
- Linux IPv6 startup scripts

**Platform:** GNS3 / Docker  
**Routing Software:** FRRouting 10.5.1  
**Status:** Completed


## 9. Download Docker Images

The six preconfigured Docker images used in this laboratory are available as a compressed archive.

**Docker Images Archive:**

[Download Dynamic IPv6 Routing Docker Images] (https://drive.google.com/file/d/1sSUk4uuRCajqr9O17Lyb8JGRk7zh5YU6/view)

The archive contains the six custom images:

- ubuntu-frr:r1-final
- ubuntu-frr:r2-final
- ubuntu-frr:r4-final
- ubuntu-ipv6:h1-final
- ubuntu-ipv6:h2-final
- ubuntu-ipv6:isp-final

### Import Docker Images

After downloading the archive, run:

```bash
gzip -dc dynamic-ipv6-docker-images.tar.gz | docker load
```

Verify the imported images:

```bash
docker images
```
