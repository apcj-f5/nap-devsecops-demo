# Demonstration of DevSecOps using NGINX App Protect

---

![License](https://img.shields.io/github/license/apcj-f5/hapi.f5labs.dev)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![GitHub branch checks state](https://img.shields.io/github/checks-status/apcj-f5/hapi.f5labs.dev/master?label=build%20checks)](https://github.com/apcj-f5/hapi.f5labs.dev/actions)
[![GitHub tag checks state](https://img.shields.io/github/checks-status/apcj-f5/hapi.f5labs.dev/deploy?label=deploy%20checks)](https://github.com/apcj-f5/hapi.f5labs.dev/actions?query=workflow:"Post+deployment+tests")
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/apcj-f5/hapi.f5labs.dev)](https://github.com/apcj-f5/hapi.f5labs.dev/pulse/monthly)

[![powered by semgrep](https://img.shields.io/badge/powered%20by-semgrep-1B2F3D?labelColor=lightgrey&link=https://semgrep.live/&style=flat-square&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAYAAAD0f5bSAAAABmJLR0QA/gD+AP+cH+QUAAAACXBIWXMAAA3XAAAN1wFCKJt4AAAAB3RJTUUH5AYMEy0l8dkqrQAAAvFJREFUKBUB5gIZ/QEAAP8BAAAAAAMG6AD9+hn/GzA//wD//wAAAAD+AAAAAgABAQDl0MEBAwbmAf36GQAAAAAAAQEC9QH//gv/Gi1GFQEC+OoAAAAAAAAAAAABAQAA//8AAAAAAAAAAAD//ggX5tO66gID9AEBFSRxAgYLzRQAAADpAAAAAP7+/gDl0cMPAAAA+wAAAPkbLz39AgICAAAAAAAAAAAs+vU12AEbLz4bAAAA5P8AAAAA//4A5NDDEwEBAO///wABAQEAAP//ABwcMD7hAQEBAAAAAAAAAAAaAgAAAOAAAAAAAQEBAOXRwxUAAADw//8AAgAAAAD//wAAAAAA5OXRwhcAAQEAAAAAAAAAAOICAAAABP3+/gDjzsAT//8A7gAAAAEAAAD+AAAA/wAAAAAAAAAA//8A7ePOwA/+/v4AAAAABAIAAAAAAAAAAAAAAO8AAAABAAAAAAAAAAIAAAABAAAAAAAAAAgAAAD/AAAA8wAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAA8AAAAEAAAA/gAAAP8AAAADAAAA/gAAAP8AAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAA7wAAAPsAAAARAAAABAAAAP4AAAAAAAAAAgAAABYAAAAAAAAAAAIAAAD8AwICAB0yQP78/v4GAAAA/wAAAPAAAAD9AAAA/wAAAPr9//8aHTJA6AICAgAAAAD8AgAAADIAAAAAAP//AB4wPvgAAAARAQEA/gEBAP4BAQABAAAAGB0vPeIA//8AAAAAAAAAABAC+vUz1QAAAA8AAAAAAwMDABwwPu3//wAe//8AAv//ABAcMD7lAwMDAAAAAAAAAAAG+vU0+QEBAvUB//4L/xotRhUBAvjqAAAAAAAAAAAAAQEAAP//AAAAAAAAAAAA//4IF+bTuuoCA/QBAQAA/wEAAAAAAwboAP36Gf8bMD//AP//AAAAAP4AAAACAAEBAOXQwQEDBuYB/foZAAAAAAD4I6qbK3+1zQAAAABJRU5ErkJggg==)](https://github.com/apcj-f5/hapi.f5labs.dev/actions?query=workflow%3ASemgrep)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/apcj-f5/hapi.f5labs.dev/master.svg)](https://results.pre-commit.ci/latest/github/apcj-f5/hapi.f5labs.dev/master)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/apcj-f5/hapi.f5labs.dev/badge)](https://api.securityscorecards.dev/projects/github.com/apcj-f5/hapi.f5labs.dev)
[![OpenSSF Best Practices](https://bestpractices.coreinfrastructure.org/projects/7409/badge)](https://bestpractices.coreinfrastructure.org/projects/7409)
[![Libraries.io dependency status for GitHub repo](https://img.shields.io/librariesio/github/apcj-f5/hapi.f5labs.dev)](https://libraries.io/github/apcj-f5/hapi.f5labs.dev)

---

**Maintainers:** [![@shsingh](https://avatars.githubusercontent.com/u/412800?s=25&v=4)](https://github.com/shsingh) [![@leonseng](https://avatars.githubusercontent.com/u/26860216?s=25&v=4)](https://github.com/leonseng)

This repository contains the necessary files for building the [HAPI-FHIR server](https://hapifhir.io)
and deployed at [https://hapi.f5labs.dev](https://hapi.f5labs.dev)

---

## Getting started

1. Clone or Fork repository
2. Ensure [pre-commit](https://pre-commit.com) is installed

```bash

local-repo-dir# pre-commit install
local-repo-dir# pre-commit run --all-files

```

3. Any commits now will run the pre-commit hook changes

## Additional information

- Ensure Git commits [are signed](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
