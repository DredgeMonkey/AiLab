# Portfolio Handoff — Historical Local AI Experiment

**Prepared for:** Portfolio Development  
**Attribution:** Spencer Armand — Systems Architect | Applied AI, Integrations & Technical Strategy  
**Source repository:** [DredgeMonkey/AiLab](https://github.com/DredgeMonkey/AiLab)  
**Scope:** documentation handoff only. **Do not change the existing portfolio without separate approval.**

## Destination and placement

Existing case study: **GPU Compute Infrastructure**  
[spencer.cognivibe.co/work/gpu-compute-infrastructure.html](https://spencer.cognivibe.co/work/gpu-compute-infrastructure.html)

Add one short subsection, tentatively **“A later experiment in local AI”**, within that existing historical infrastructure narrative. Do not add a homepage card or standalone AI Lab case study. The successful earlier GPU mining/infrastructure installation and the unfinished January 2025 AI Lab must remain clearly distinct.

## Evidence-backed proposed section

> **A later experiment in local AI**  
> In January 2025, I revisited a small part of my earlier GPU hardware experience by attempting to repurpose two NVIDIA GTX 1080 cards for a local, Docker-based AI development environment. The proposed setup combined Linux GPU drivers, CUDA, containerized development tooling, JupyterLab, and machine-learning frameworks. CUDA 12.2 sample testing successfully detected both GPUs and returned a passing `deviceQuery` result in the historical troubleshooting records. However, framework-level GPU integration remained unresolved: TensorFlow encountered CUDA library-loading and device-enumeration errors, alongside container and dependency-compatibility problems. The project did not become a validated multi-GPU ML environment. It remains a useful, documented study in hardware reuse, system integration, and the distinction between component-level validation and an operational platform. In retrospect, this exploration helped inform my later thinking about local compute for SANCTUM-CIRCE, although the later modular Raspberry Pi nodes were a separate engineering direction.

The final sentence is Spencer's retrospective account of the project's intellectual relationship to SANCTUM-CIRCE, not direct implementation evidence. This copy is a **draft for separate editorial approval**, not an instruction to publish now. Historical `deviceQuery` outcomes are supported by indexed 2025 user-reported logs, not by raw test outputs committed to GitHub; avoid describing them as directly reproducible from the repo.

## Link and attribution rules

- If and only if this repository is separately approved for public release, a discreet source link may point to `https://github.com/DredgeMonkey/AiLab`.
- While private, do not add a public link that implies visitors can inspect it.
- Credit the project to **Spencer Armand**, not the historical Docker Hub handle.
- Do not describe TensorFlow/PyTorch ML execution as successful, the environment as finalized, the Dockerfile as current/reproducible, or the earlier GPU mining rigs as part of the 2025 AI Lab.
- Do not imply the 2025 AI Lab was a functioning SANCTUM-CIRCE node or a direct precursor implementation; the architectural relationship is explicitly retrospective and conceptual.
- Keep the treatment short and proportionate to a historical technical supporting detail. No new design, feature claims, website rebuild, or speculative software expansion.

## Supporting evidence and limitations

- [README.md](../README.md): project status and overview.
- [HISTORICAL_EVIDENCE.md](HISTORICAL_EVIDENCE.md): dated source classification and successful/unsuccessful milestones.
- [KNOWN_LIMITATIONS.md](KNOWN_LIMITATIONS.md): outstanding validation and security limitations.
- Original January 15, 2025 Git history: Dockerfile, requirements list, and first README.

**Handoff state:** ready for portfolio editorial review after this repository documentation PR has been reviewed. Website remains unchanged.
