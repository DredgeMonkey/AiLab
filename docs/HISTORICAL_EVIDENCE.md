# Historical Evidence and Technical Chronology

**Project:** CogniVibe AI Lab | **Owner:** Spencer Armand | **Period examined:** January 12–18, 2025

## Evidence method

This is a provenance-aware reconstruction, not a copied test log.

- **R — Repository-direct:** content and dates independently inspected in the three original Git commits.
- **H — Historical conversation record:** indexed January 2025 *user messages* describing or supplying terminal results. Specific events were recoverable, but the complete original terminal blocks have not been exported to this repository. Therefore these should not be quoted as independently inspected raw logs.
- **P — Proposed/attempted:** assistance, commands, configuration intentions, or actions without proof of successful execution.
- **U — Unverified:** missing outcome or missing direct supporting material.

Source strength matters. A Docker instruction in a README is R as a documented instruction but does not prove the command was run. An assistant-proposed fix is P until user-executed output confirms it.

## Dated reconstruction

| Date (January 2025) | Observation | Status and limits |
| --- | --- | --- |
| **12** | Initial mixed GPU discussion described a GTX 1080 alongside an AMD Radeon RX 560 and an intended local AI/CogniVibe environment. An NVIDIA CUDA 11.7.1 development-container workflow was recommended. | H for stated equipment/goal; P for suggested container setup. |
| **13** | User-reported saved Docker image archives named `ai-dev-env_latest.tar` and `ai-dev-env_v1.0.tar` (~7.6 GB each). Earlier attempt to save image `ai-dev-env:1.0` returned a missing-reference error. | H; saved archive contents not inspected here. |
| **15** | Local `ai-dev-env:1.0` image identified (~8.05 GB); push of `gentsotoes/ai-dev-env:1.0` reported successful. Running this image under CUDA 11.7.1 produced a `jupyter-notebook` command-not-found error. An attempted push of `gentsotoes/cognivibe-ai-lab:1.0` was denied. | H; image availability today and any later derivative push remain U. |
| **15** | Git repository created. Commit `3fe016a` introduced initial README; `54934e3` added `Dockerfile` and `requirements.txt`; `a05017e` documented the intended workflow in README. | R; only three commits and three tracked files existed at review. |
| **16** | User reported Ubuntu 24.04, NVIDIA driver 535.183.01, CUDA 12.2 reported by `nvidia-smi`. A CUDA 12.6 container attempt failed the host driver requirement `cuda>=12.6`. One GTX 1080 was observed in an earlier successful `deviceQuery` sample. | H; this was an intermediate host configuration, **not** proof of the eventual two-GPU system. |
| **17** | User reported switching to Ubuntu 22.04 after driver/dependency problems. Later CUDA testing identified two GTX 1080s, compute capability 6.1, peer-access capability in both directions, and `Result = PASS`. TensorFlow 2.18.0 reported cuFFT/cuDNN/cuBLAS factory-registration problems and GPU library-loading failures. | H; sample-level success and framework-level failure are separate. |
| **18** | User again ran CUDA 12.2 `deviceQuery` from a local CUDA demos path; both GTX 1080s were detected and sample returned `Result = PASS`. The AMD RX 560 was reported as OpenGL/display renderer during investigation. TensorFlow was downgraded in a separate virtual environment from 2.18.0 to 2.10.1 with dependency changes. | H; no subsequent successful framework GPU test recovered. |

Historical materials also refer to cuDNN 8.9.7.29, NVIDIA Container Toolkit work, a host/container driver-library mismatch, Jupyter startup issues, Docker runtime package conflicts, and X11/XRandR investigations. These are credible troubleshooting topics, but no complete diagnostic records were available here to assign more precise results to every step.

## What the repository directly proves

1. A real, dated, original configuration was committed on January 15, 2025.
2. The Dockerfile extends `gentsotoes/ai-dev-env:1.0`, attempts OS dependencies, Jupyter/ML libraries, MongoDB client tooling, and Node/React utilities, and sets a Jupyter launch command.
3. It includes explicit PyTorch `2.0.1+cu117`, torchvision `0.15.2+cu117`, and torchaudio `2.0.2+cu117` tags.
4. It does **not** install `requirements.txt`, does **not** pin the full environment, and allows the main ML pip step to report success despite failures through `|| true`.
5. Neither repository files nor commit history contain hardware test logs, Jupyter session records, working TensorFlow/PyTorch notebooks, end-to-end acceptance tests, or a released application.

Repository commits: [initial](https://github.com/DredgeMonkey/AiLab/commit/3fe016a8d8c6cc0f16110a16c6f488ac23641868), [configuration](https://github.com/DredgeMonkey/AiLab/commit/54934e34643b5503e3af70f424eed07ab7668648), and [historical README](https://github.com/DredgeMonkey/AiLab/commit/a05017ec12d83547687d28c7b2e3d992ca8681d1).

## Supported outcome

**Validated at the CUDA sample level:** two GTX 1080s enumerated and the sample returned `Result = PASS` in user-provided historical reporting. Peer access was reported. This is meaningful evidence that the host CUDA layer worked during part of troubleshooting.

**Not validated at the ML framework or complete-environment level:** TensorFlow had GPU library and enumeration errors; Jupyter had startup errors; host/container compatibility changed during troubleshooting. No clean run confirming all layers of the final intended system was recovered.

## Evidence gaps / future archival supplements

1. Export the original January 2025 terminal outputs (especially `deviceQuery`, `nvidia-smi`, TensorFlow GPU test, Docker push result, and any Jupyter/container startup output) if preserving the precise bytes becomes useful.
2. Recover the original Docker image digests, Docker Hub visibility/status, image Dockerfiles or manifests if they still exist. A tag in this repository is not a guarantee of availability.
3. Determine whether `gentsotoes/cognivibe-ai-lab:2.0` was successfully built or pushed; the README's tag is not enough.
4. Preserve OS, toolkit, cuDNN, driver and Python package versions associated with each distinct test. The host changed during the effort.
5. No direct evidence was recovered of a fully functioning multi-GPU ML workload, accessible Jupyter session, or successful final-image acceptance test.

These gaps do not invalidate the project; they bound what its historical record can truthfully claim. No evidence has been invented to fill them.
