# Security in CI/CD pipelines with NGINX App Protect

![License](https://img.shields.io/github/license/apcj-f5/nap-devsecops-demo)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![GitHub branch checks state](https://img.shields.io/github/checks-status/apcj-f5/nap-devsecops-demo/master?label=build%20checks)](https://github.com/apcj-f5/nap-devsecops-demo/actions)
[![GitHub deploy checks state](https://img.shields.io/github/checks-status/apcj-f5/nap-devsecops-demo/deploy?label=deploy%20checks)](https://github.com/apcj-f5/nap-devsecops-demo/actions)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/apcj-f5/nap-devsecops-demo)](https://github.com/apcj-f5/nap-devsecops-demo/pulse/monthly)

[![powered by semgrep](https://img.shields.io/badge/powered%20by-semgrep-1B2F3D?labelColor=lightgrey&link=https://semgrep.live/&style=flat-square&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAA0AAAAOCAYAAAD0f5bSAAAABmJLR0QA/gD+AP+cH+QUAAAACXBIWXMAAA3XAAAN1wFCKJt4AAAAB3RJTUUH5AYMEy0l8dkqrQAAAvFJREFUKBUB5gIZ/QEAAP8BAAAAAAMG6AD9+hn/GzA//wD//wAAAAD+AAAAAgABAQDl0MEBAwbmAf36GQAAAAAAAQEC9QH//gv/Gi1GFQEC+OoAAAAAAAAAAAABAQAA//8AAAAAAAAAAAD//ggX5tO66gID9AEBFSRxAgYLzRQAAADpAAAAAP7+/gDl0cMPAAAA+wAAAPkbLz39AgICAAAAAAAAAAAs+vU12AEbLz4bAAAA5P8AAAAA//4A5NDDEwEBAO///wABAQEAAP//ABwcMD7hAQEBAAAAAAAAAAAaAgAAAOAAAAAAAQEBAOXRwxUAAADw//8AAgAAAAD//wAAAAAA5OXRwhcAAQEAAAAAAAAAAOICAAAABP3+/gDjzsAT//8A7gAAAAEAAAD+AAAA/wAAAAAAAAAA//8A7ePOwA/+/v4AAAAABAIAAAAAAAAAAAAAAO8AAAABAAAAAAAAAAIAAAABAAAAAAAAAAgAAAD/AAAA8wAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAA8AAAAEAAAA/gAAAP8AAAADAAAA/gAAAP8AAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAA7wAAAPsAAAARAAAABAAAAP4AAAAAAAAAAgAAABYAAAAAAAAAAAIAAAD8AwICAB0yQP78/v4GAAAA/wAAAPAAAAD9AAAA/wAAAPr9//8aHTJA6AICAgAAAAD8AgAAADIAAAAAAP//AB4wPvgAAAARAQEA/gEBAP4BAQABAAAAGB0vPeIA//8AAAAAAAAAABAC+vUz1QAAAA8AAAAAAwMDABwwPu3//wAe//8AAv//ABAcMD7lAwMDAAAAAAAAAAAG+vU0+QEBAvUB//4L/xotRhUBAvjqAAAAAAAAAAAAAQEAAP//AAAAAAAAAAAA//4IF+bTuuoCA/QBAQAA/wEAAAAAAwboAP36Gf8bMD//AP//AAAAAP4AAAACAAEBAOXQwQEDBuYB/foZAAAAAAD4I6qbK3+1zQAAAABJRU5ErkJggg==)](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/secops-code-scan.yml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/apcj-f5/nap-devsecops-demo/master.svg)](https://results.pre-commit.ci/latest/github/apcj-f5/nap-devsecops-demo/master)
[![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/apcj-f5/nap-devsecops-demo/badge)](https://api.securityscorecards.dev/projects/github.com/apcj-f5/nap-devsecops-demo)
[![OpenSSF Best Practices](https://bestpractices.coreinfrastructure.org/projects/7409/badge)](https://bestpractices.coreinfrastructure.org/projects/7409)

---

| [![OWASP ZAP](https://avatars.githubusercontent.com/u/6716868?s=15&v=4)](https://zaproxy.org) ZAP Baseline Scan  | [![OWASP ZAP](https://avatars.githubusercontent.com/u/6716868?s=15&v=4)](https://zaproxy.org) ZAP Full Scan  | [![OWASP ZAP](https://avatars.githubusercontent.com/u/6716868?s=15&v=4)](https://zaproxy.org) ZAP API Scan  |
| --- | --- | --- |
| [![hapi.f5labs.dev - ZAP Baseline Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/hapi.f5labs.dev-zap-baseline.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+Baseline+Scan"+in:title) | [![hapi.f5labs.dev - ZAP Full Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/hapi.f5labs.dev-zap-full.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+Full+Scan"+in:title) | [![hapi.f5labs.dev - ZAP API Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/hapi.f5labs.dev-zap-api.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+API+Scan"+in:title) |
[![bank.f5labs.dev - ZAP Baseline Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/bank.f5labs.dev-zap-baseline.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+Baseline+Scan"+in:title) | [![bank.f5labs.dev - ZAP Full Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/bank.f5labs.dev-zap-full.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+Full+Scan"+in:title) |
[![gql.f5labs.dev - ZAP Baseline Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/gql.f5labs.dev-zap-baseline.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+Baseline+Scan"+in:title) | [![gql.f5labs.dev - ZAP Full Scan](https://github.com/apcj-f5/nap-devsecops-demo/actions/workflows/gql.f5labs.dev-zap-full.yml/badge.svg)](https://github.com/apcj-f5/nap-devsecops-demo/issues?q=is:issue+is:open+"OWASP+ZAP+Full+Scan"+in:title)

---

**Maintainers:**
[![@shsingh](https://avatars.githubusercontent.com/u/412800?s=25&v=4)](https://github.com/shsingh)
[![@leonseng](https://avatars.githubusercontent.com/u/26860216?s=25&v=4)](https://github.com/leonseng)

This repository hosts files that demonstrate using F5 security solutions (NGINX
App Protect, NGINX App Protect DoS, F5 Distributed Cloud) for post-deployment
security in application CI/CD pipelines.

Integrating security into post-deployment processes as part of Continuous
Delivery/Continuous Deployment ensure that applications at runtime have proper
controls, and can also be checked for compliance.

## Repository Information

This repository aims to follow security recommended practices for opensource
software and contains the following:

- [OpenSSF Best Practices](https://bestpractices.coreinfrastructure.org/en/projects/7409)
  for projects
- [Scorecard](https://api.securityscorecards.dev/projects/github.com/apcj-f5/nap-devsecops-demo)
  for validation of OpenSSF Best Practices
- Github organisation [apcj-f5](https://github.com/apcj-f5) uses the
  [Allstar application](https://github.com/ossf/allstar) with the following
  [configuration files](https://github.com/apcj-f5/.allstar)

## Reference Implementation

The reference implementation uses the [HAPI FHIR](https://hapifhir.io)
application. The application provides an example API gateway for digital health
use cases. Source code for the application is in the [apps](apps/) directory.

- Website for the live implementation is at
  [https://nap-devsecops-demo](https://nap-devsecops-demo)
- Build information from ArgoCD for the deployment is at
  [https://build.f5labs.dev](https://build.f5labs.dev)

![Reference Implementation](docs/images/Reference%20Implementation%20-%20hapi.f5labs.dev.png)

### Pipeline details

- SAST using [Semgrep](https://semgrep.dev) with the following
  [workflow run details](https://github.com/apcj-f5/nap-devsecops-demo/actions?query=workflow%3ASemgrep)
- Dependency Checking
  [workflow run details](https://github.com/apcj-f5/nap-devsecops-demo/actions?query=workflow%3A%22Dependency%20Review%22)
  and using
  [Renovate](https://github.com/apcj-f5/nap-devsecops-demo/blob/master/renovate.json)
  for updating dependencies
- Post deployment functional testing using
  [newman](argocd/manifests/hapi/hooks/hook-postsync.yaml) to check WAF blocking
  policy effectiveness and false positives

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

- Ensure Git commits
  [are signed](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
