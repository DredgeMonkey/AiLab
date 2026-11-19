# CogniVibe AI Lab

**Historical engineering archive | January 2025 | Spencer Armand**

> **Status: partially validated experiment, not a completed or supported AI development platform.** The original Docker configuration and dependency list are preserved as historical artifacts. Do not execute them as contemporary setup instructions.

## Project overview

In January 2025, I attempted to repurpose two retained NVIDIA GeForce GTX 1080 GPUs into a local, Docker-based AI development environment. The goal was to study GPU-accelerated machine learning and support Python, JupyterLab, data-science libraries, and application development using existing hardware rather than purchasing a new compute platform.

This was separate from my earlier, successfully operated high-density GPU infrastructure used primarily for cryptocurrency mining and hardware experimentation. The earlier mining installation and this later AI Lab effort must not be conflated.

## What this repository contains

| File | Historical role |
| --- | --- |
| [Dockerfile](Dockerfile) | Container build recipe extending a preexisting development image, with Jupyter/ML and application tooling. |
| [requirements.txt](requirements.txt) | Historical Python dependency inventory, not a lockfile or a proven installed environment. |
| [docs/HISTORICAL_EVIDENCE.md](docs/HISTORICAL_EVIDENCE.md) | Dated evidence inventory and source-strength distinctions. |
| [docs/KNOWN_LIMITATIONS.md](docs/KNOWN_LIMITATIONS.md) | Unresolved validation, reproducibility, and security concerns. |
| [docs/PORTFOLIO_HANDOFF.md](docs/PORTFOLIO_HANDOFF.md) | Bounded summary for the existing GPU infrastructure case study. |

Git history retains the original January 15, 2025 revisions, including the original README. The Dockerfile and requirements.txt have intentionally **not** been modernized or replaced.

## Original intended architecture

- **Hardware:** two NVIDIA GTX 1080 GPUs (Pascal, compute capability 6.1), with historical mixed NVIDIA/AMD display troubleshooting.
- **Host:** Ubuntu Linux, NVIDIA driver/CUDA toolkit, Docker and NVIDIA GPU container runtime. Records show OS and environment changes during troubleshooting; no single final reproducible host configuration is established.
- **Container:** extends the historical image name `gentsotoes/ai-dev-env:1.0`; a derivative was planned/tagged `gentsotoes/cognivibe-ai-lab:2.0`. Present-day availability of these external images is not verified.
- **ML/data:** attempted TensorFlow, PyTorch CUDA 11.7 wheels, scikit-learn, transformer/data libraries, and NVIDIA cuDF/cuML packages.
- **Development:** JupyterLab/notebook; FastAPI/Uvicorn, Node.js/React utilities, and MongoDB client tooling.
- **Runtime concept:** expose container port 8888 and publish a dynamically assigned host port using Docker's `-P` option.

The repository specifies intended components and configuration choices; it does **not** prove that each package was installed, each image built successfully, or the full system operated.

## Observed milestones and boundaries

| Finding | Evidence status | What it establishes |
| --- | --- | --- |
| Original container and dependency recipes committed January 15, 2025 | **Direct repository evidence** | A documented implementation attempt and dependency strategy. |
| `gentsotoes/ai-dev-env:1.0` image pushed January 15, 2025 | **Historical user-reported terminal record** | A base development image was published at that time; no present-day availability claim. |
| CUDA 12.2 `deviceQuery` reported `Result = PASS` for two GTX 1080 GPUs (January 17–18) | **Historical user-reported terminal record** | CUDA-level enumeration and sample testing succeeded; peer access was reported. |
| TensorFlow 2.18.0 failed to enumerate/use GPUs, with library-loading and cuFFT/cuDNN/cuBLAS messages | **Historical user-reported terminal record** | GPU-enabled framework operation was **not validated**. |
| Jupyter command/startup errors and CUDA container/driver compatibility problems | **Historical troubleshooting record** | Integration remained unresolved. |

The historical chat index corroborates that the user supplied these results in January 2025, but complete verbatim command/output transcripts have not been recovered into this repository. They are therefore not presented here as directly reproducible test artifacts. Details and provenance are in [HISTORICAL_EVIDENCE.md](docs/HISTORICAL_EVIDENCE.md).

**Not demonstrated:** a reliably running multi-GPU Jupyter/ML development platform, successful TensorFlow or PyTorch GPU workloads in the final container, complete host/container reproducibility, or production deployment. A successful CUDA sample does not imply any of those outcomes.

## Engineering lessons

The work exposed the difference between hardware recognition and application-framework readiness. Host drivers, CUDA runtime/toolkit versions, cuDNN and other native libraries, Python wheels, and NVIDIA container-runtime configuration are separate compatibility layers. The effort also illustrated why dependency pinning, fail-fast builds, isolation of host packages from container dependencies, and end-to-end acceptance tests matter.

These are documented lessons from actual integration attempts—not claims that the unresolved environment was subsequently completed.

## Archival and publication safety

- **Do not use the legacy Dockerfile or requirements.txt as installation guidance.** They are intentionally unchanged evidence.
- The historical `docker run --gpus all -P` approach can expose Jupyter on host interfaces. Authentication, network binding, and inherited image defaults were not independently verified. Do not run it on an exposed system.
- The Dockerfile includes a `|| true` sequence that can hide dependency-installation failures. It does **not** run `pip install -r requirements.txt`.
- The referenced external Docker images, registries, and package repositories were not independently authenticated or tested in this archival audit.
- A review of the **tracked source and three known commits** found no obvious embedded passwords, API keys, or tokens; that is not a security audit of the original machine, external images, or untracked files.

Read [KNOWN_LIMITATIONS.md](docs/KNOWN_LIMITATIONS.md) before considering any reuse. No Docker builds, installations, host changes, or live workload tests were performed for this documentation recovery.

## Professional context

This project documents a later experiment in local AI built on earlier hands-on GPU infrastructure experience. Its value is evidence of practical hardware reuse, Linux/GPU troubleshooting, container architecture, and honest validation boundaries—not a claim of a finished AI product.

**Attribution:** Spencer Armand — Systems Architect | Applied AI, Integrations & Technical Strategy.
