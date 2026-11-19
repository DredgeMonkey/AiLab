# Known Limitations, Reproducibility and Security

**Scope:** archival, non-executing review of the three tracked files and three original commits in `DredgeMonkey/AiLab`, supplemented by indexed January 2025 conversation records. This is not a live vulnerability scan, host audit, container image inspection, or certification of safety.

## Functional validation limits

| Layer | What is known | What remains unresolved |
| --- | --- | --- |
| GPUs / host CUDA | Two GTX 1080s reported detected; CUDA 12.2 `deviceQuery` passed in January 2025. | No retained raw benchmark/log archive in the Git repository; the status of the old machine now is unknown. |
| CUDA/runtime versions | Driver 535.183.01 and CUDA 12.2 observed at one point; CUDA 11.7.1 in a historical container; attempted CUDA 12.6 image failed driver requirements. | A single consistent tested host/container version matrix is absent. |
| NVIDIA libraries | cuDNN 8.9.7.29 and cuFFT/cuDNN/cuBLAS issues appear in historical troubleshooting. | Complete final native library and ABI compatibility not proven. |
| TensorFlow | 2.18.0 generated GPU library-loading and enumeration problems; later 2.10.1 was installed into a virtual environment. | Successful TensorFlow GPU compute after downgrade not documented. |
| PyTorch | CUDA 11.7-specific wheels specified in source. | Installed wheel status, CUDA visibility, and GPU kernel execution not evidenced. |
| Container + Jupyter | Source defines Jupyter startup and runtime options; startup errors are recorded. | End-to-end verified Jupyter access and ML workflow not evidenced. |

## Source-level engineering observations

1. **Silent installation failure:** the main Jupyter/ML `RUN` sequence ends in `|| true`; a failed `pip install` may not fail the Docker build. Neither a successful build nor the README's package list establishes installed functionality.
2. **Requirements not consumed:** the Dockerfile has no `COPY requirements.txt` and no `pip install -r requirements.txt`. The requirements file is an independent historical inventory. It includes entries not mentioned in the Dockerfile.
3. **Inconsistent dependency management:** multiple packages are unpinned; some use pinned CUDA 11.7 PyTorch wheels; the requirements list also includes Ubuntu/distribution-related Python packages and `asyncio`, a standard-library module. Resolving this list as a cross-platform modern pip environment cannot be assumed.
4. **Mutable and external dependencies:** `FROM gentsotoes/ai-dev-env:1.0` is not pinned by immutable digest here. A NodeSource setup script is fetched and run via a shell pipeline, the MongoDB APT source targets Ubuntu `focal`, and package repositories may have changed or disappeared. The Ubuntu version and dependencies inherited from the base image are unknown.
5. **Version mismatch risk:** host CUDA 12.2 success, CUDA 11.7 PyTorch wheels and image, and a CUDA 12.6 failed container attempt refer to different integration layers and historical configurations; no single successful combination is documented.
6. **Opaque inherited image:** this repository cannot establish which users, services, packages, binaries, entrypoints, volumes, default Jupyter settings, or vulnerabilities existed in the prebuilt base image.
7. **Port behavior:** `EXPOSE 8888` plus Docker `-P` maps the exposed container port to an available host port. `JUPYTER_PORT` changes the listening port of the command, but does not automatically update the Dockerfile's exposed port, so changing it alone may invalidate the mapping.
8. **No application implementation:** FastAPI, React and MongoDB appear as tooling/dependencies, not completed services or a deployed application in this repository.

## Security and public-release review

- **Credentials:** no obvious hard-coded passwords, access tokens, private keys or API secrets were found in the current tracked files or the inspected original commits. This does not cover untracked files, Docker image layers, local host history, private registries or previous machines.
- **User privileges:** the Dockerfile does not declare `USER` and Jupyter is invoked with `--allow-root`. Effective runtime privileges depend on the inherited base image; running Jupyter as root should not be assumed safe.
- **Jupyter exposure:** Jupyter is bound to `0.0.0.0` inside the container. Docker `-P` can publish the exposed port to host interfaces beyond localhost. Token/password authentication is not explicitly configured in this repository; inherited/default behavior is unverified. **Do not follow the historical run command on any public or untrusted network.**
- **Untrusted/legacy components:** package sources and older, unpinned dependencies may present supply-chain or vulnerability risk. We did not run any installers or obtain a live dependency/vulnerability report.
- **External images:** source mentions `gentsotoes/ai-dev-env:1.0` and `gentsotoes/cognivibe-ai-lab:2.0`; their present visibility, contents, security and tags were not independently verified. An old reported push is historical evidence, not present-day endorsement.
- **Local paths:** `~/docker-projects/cognivibe-ai-lab` is a historical machine-specific example. No current deployment path is established.

## Publication readiness decision

**Conditional, documentation-ready; not operationally reusable.** With explicit historical/archive labeling and the limitations above, the three original tracked source files do not reveal an obvious credential blocker to a public *archival* repository. However, that is not authorization to make the repository public. A final human review should check the full GitHub diff, account names, personal context, any archived Docker layers considered for inclusion, and whether public exposure serves the portfolio.

No source-file changes, dependency updates, container rebuilds or runtime tests were necessary for this assessment. Keep this repo private until Spencer Armand explicitly approves publication.
