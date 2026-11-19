# Historical Evidence and Technical Chronology

**Project:** CogniVibe AI Lab | **Owner:** Spencer Armand | **Period examined:** January 12–18, 2025 (last recovered detailed records, not a verified shutdown date)

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
| **12** | The intended AI workstation was **“Big Bertha”**: Intel i7-3770K, ASUS Maximus V Formula / Z77, 16 GB DDR3 and a legacy BIOS, originally running Windows 10. User proceeded toward Ubuntu 24 LTS and planned to repurpose GTX 1080 cards; the AMD Radeon RX 560 was introduced as a separate display GPU. A CUDA 11.7.1 development-container approach was also suggested. | H for user-stated configuration, OS change and GPU intentions; P for suggested container setup. Other computers were discussed as part of a broader personal development suite, not evidence of deployed AI Lab nodes. |
| **13** | User-reported saved Docker image archives named `ai-dev-env_latest.tar` and `ai-dev-env_v1.0.tar` (~7.6 GB each). Earlier attempt to save image `ai-dev-env:1.0` returned a missing-reference error. | H; saved archive contents not inspected here. |
| **15** | Local Docker image `gentsotoes/ai-dev-env:1.0` identified (~8.05 GB). User-supplied January 15 terminal output recorded a successful **Docker Hub push** of that base-image tag, with digest `sha256:0e1b81707a118f9fe585c9e616007d904b2215079ef71fc89b28c656b5539250` (manifest size 4102). An earlier attempted push was denied. Running a CUDA 11.7.1 image produced a `jupyter-notebook` command-not-found error. Attempted push of `gentsotoes/cognivibe-ai-lab:1.0` was **denied**; other troubleshooting included missing image tags and a host port 8888 bind conflict. | H; the base-image and derivative-image events must not be conflated. Present-day image availability and any later derivative push remain U. |
| **15** | Git repository created. Commit `3fe016a` introduced initial README; `54934e3` added `Dockerfile` and `requirements.txt`; `a05017e` documented the intended workflow in README. | R; only three commits and three tracked files existed at review. |
| **16** | On Ubuntu 24.04, the user reported Big Bertha’s i7-3770K, 16 GB RAM, an approximately 112 GB OS SSD and 931.5 GB data HDD, with the second GTX 1080 still pending at one point. Driver **550.120** / CUDA **12.4** was reported during the intermediate setup; later output showed driver **535.183.01** / CUDA **12.2**. Docker/containerd package conflicts and a failed CUDA 12.6 runtime requirement (`cuda>=12.6`) occurred. | H; multiple driver/toolkit states were observed and must not be presented as one stable configuration. The two-GPU success was still ahead. |
| **17** | User reported a fresh Ubuntu 22.04 installation after driver/dependency issues. A CUDA 12.2 `deviceQuery` test **first passed with one GTX 1080**. Subsequent hardware/display troubleshooting identified a second GTX 1080 and the RX 560. User reported the `/data/ai-libs/cuda/cuda-12.2` path and separate TensorFlow/PyTorch virtual-environment directories under `/data/virtualenvs/`. TensorFlow 2.18.0 encountered cuFFT/cuDNN/cuBLAS registration and GPU library-loading issues. | H; one-device CUDA validation and the existence of environment directories do **not** prove two-GPU framework execution. |
| **18** | CUDA 12.2 `deviceQuery` **passed with both GTX 1080s**, each compute capability 6.1, with reported peer access in both directions. The AMD RX 560 was observed as the display/OpenGL renderer. TensorFlow was changed in a separate virtual environment from 2.18.0 to 2.10.1, with dependency changes. | H; neither the two-GPU CUDA sample nor a TensorFlow package downgrade demonstrates successful TensorFlow/PyTorch GPU computation. |

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

1. Export the full original January 2025 terminal outputs (especially `deviceQuery`, `nvidia-smi`, TensorFlow GPU test, successful base-image Docker push output, and any Jupyter/container startup output) if preserving the precise bytes becomes useful. The base-image push digest above was recovered from an indexed user-provided terminal result, not a file committed here.
2. If needed, recover additional image digests, Docker Hub visibility/status, the actual image layers, Dockerfiles or manifests. The recovered base-image push digest is historical evidence and is not a guarantee the image is still available.
3. Determine whether `gentsotoes/cognivibe-ai-lab:2.0` was successfully built or pushed; the README's tag is not enough.
4. Preserve OS, toolkit, cuDNN, driver and Python package versions associated with each distinct test. The host changed during the effort.
5. No direct evidence was recovered of a fully functioning multi-GPU ML workload, accessible Jupyter session, or successful final-image acceptance test. **January 18, 2025 is the last detailed troubleshooting record recovered here, not an independently verified date when work ceased.**

These gaps do not invalidate the project; they bound what its historical record can truthfully claim. No evidence has been invented to fill them.
