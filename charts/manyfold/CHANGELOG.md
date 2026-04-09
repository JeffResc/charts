# Changelog

## [1.0.2](https://github.com/JeffResc/charts/compare/manyfold-1.0.1...manyfold-1.0.2) (2026-04-09)


### Miscellaneous

* **deps:** update helm release postgresql to v18.5.16 ([#130](https://github.com/JeffResc/charts/issues/130)) ([72b17e9](https://github.com/JeffResc/charts/commit/72b17e95a6f24031240068112c74152f4e449c79))
* **deps:** update helm release valkey to v5.4.10 ([#132](https://github.com/JeffResc/charts/issues/132)) ([f8e4223](https://github.com/JeffResc/charts/commit/f8e42230945cb99bf69400c962b4d161b0254e15))

## [1.0.1](https://github.com/JeffResc/charts/compare/manyfold-1.0.0...manyfold-1.0.1) (2026-04-02)


### Miscellaneous

* **deps:** update ghcr.io/manyfold3d/manyfold docker tag to v0.136.0 ([2ee3079](https://github.com/JeffResc/charts/commit/2ee30793206973c9ce424841861689e9ba15fb85))
* **deps:** update helm release postgresql to v18 ([0ca7ad5](https://github.com/JeffResc/charts/commit/0ca7ad5ee2521c23b8e49f2d8231234df4be8ea1))

## [1.0.0](https://github.com/JeffResc/charts/compare/manyfold-0.1.8...manyfold-1.0.0) (2026-04-02)


### ⚠ BREAKING CHANGES

* **manyfold:** `redis.*` values are now `valkey.*`. Users with custom redis overrides must rename them to valkey.

### refactor

* **manyfold:** replace Redis dependency with Valkey ([ddacc13](https://github.com/JeffResc/charts/commit/ddacc13ef6a127686f60fe3d84f9a747097fbaa8))


### Features

* automate release workflow and add GHCR OCI publishing ([f073775](https://github.com/JeffResc/charts/commit/f0737751f3217816761ef4cdb82f87105b699799))
* integrate release-please for unified chart release automation ([edc0bb9](https://github.com/JeffResc/charts/commit/edc0bb9396e7c714b181c545e45d434433bc95c9))


### Bug Fixes

* point READMEs to charts.jeffresc.dev, fix publish workflow ([f54a0cd](https://github.com/JeffResc/charts/commit/f54a0cd8dabe3a1be95222e0b1afc1f14501b25c))


### Miscellaneous

* **deps:** update ghcr.io/manyfold3d/manyfold docker tag to v0.136.0 ([30fc1e4](https://github.com/JeffResc/charts/commit/30fc1e4dadbcd43623ca0a0d27c9fc4c7802af0e))
* **deps:** update helm release postgresql to v16.7.21 ([2995132](https://github.com/JeffResc/charts/commit/2995132ff26337d15aea495e0f666148267296f3))
* **deps:** update helm release postgresql to v16.7.27 ([#106](https://github.com/JeffResc/charts/issues/106)) ([529f2b0](https://github.com/JeffResc/charts/commit/529f2b0041447175313b191048f7e314cc2317bd))
* **deps:** update helm release postgresql to v18 ([3e527f0](https://github.com/JeffResc/charts/commit/3e527f0b6169ed72eafcf089fa9e09054451351a))
* **deps:** update helm release postgresql to v18.5.15 ([#102](https://github.com/JeffResc/charts/issues/102)) ([ec4c1aa](https://github.com/JeffResc/charts/commit/ec4c1aa1ef1233b3ae31c148aac958c93a73e460))
* **manyfold:** regenerate Chart.lock for valkey dependency ([fe3a6d6](https://github.com/JeffResc/charts/commit/fe3a6d6d8cf26b7e74ddfe5e021104a682adc2b6))
* regenerate docs ([352898c](https://github.com/JeffResc/charts/commit/352898c3dd148ef00fb0d8fe7d2710874388276c))
* remove leftover Bitnami [@extra](https://github.com/extra) annotations from values.yaml ([ca853fa](https://github.com/JeffResc/charts/commit/ca853fa7dd84c4107d58b3229a361d935de463a8))
