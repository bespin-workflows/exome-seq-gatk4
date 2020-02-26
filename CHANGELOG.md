# Version History: exomeseq-gatk4

All notable changes to this workflow will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.1.0] - 2020-02-26

### Changed

- Increased BaseRecalibrator memory requirement to 12G.
- Increased CombineGVCFs memory requirement to 16G.
- Updated workflows to use [fastp](https://github.com/OpenGene/fastp) instead of FastQC and Trim Galore for performance.

### Removed
- Removed DP(Depth of coverage) flag from VariantRecalibration because it is inappropriate for exome datasets: https://github.com/bespin-workflows/exomeseq-gatk4/issues/11

### Added
- Added code to save mark duplicate metric reports

## [2.0.3] - 2020-01-08

- Changed variant recalibration for Indels and SNPs to hard code resource values.
  This is to compatible with toil due to a bug: https://github.com/DataBiosphere/toil/issues/2814
- Increased memory requirements for MarkDuplicates to fix out of memory errors when running under toil/slurm.

## [2.0.2] - 2019-08-29

### Changed

- Set pipefail in concat-gz-files, for more immediate failures.

## [2.0.1] - 2019-04-30

### Changed

- Tweaked fastqc and trim\_galore tools to make them cache-able
- Fixed bugs in variantdiscovery subworkflow, adds CombineGVCFs step to combine variants.

## [2.0.0] - 2019-03-29

### Added

- Initial release of exomeseq-gatk4.cwl variant calling workflow, migrated from exomeseq-gatk4.cwl in [bespin-cwl v0.9.5](https://github.com/Duke-GCB/bespin-cwl/releases/tag/v0.9.5)
- Adds JSON tool examples for several of the GATK4 tools (with embedded file contents)

### Changed

- Adds HaplotypeCaller step to exomeseq-gatk4-preprocessing workflow, migrated from exomeseq-gatk4-preprocessing.cwl in [bespin-cwl v0.9.5](https://github.com/Duke-GCB/bespin-cwl/releases/tag/v0.9.5)
- Removes unnecessary steps in preprocessing
- Moves custom CWL types into individual files
- Optimizes the concat-gz-files step to skip recompression on single files

## [1.0.0] - 2019-03-29

### Added

- Initial release of exomeseq-gatk4 preprocessing workflow, migrated from exomeseq-gatk4-preprocessing.cwl in [bespin-cwl v0.9.4](https://github.com/Duke-GCB/bespin-cwl/releases/tag/v0.9.4)

[Unreleased]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v2.0.3...release-2.0
[2.0.3]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v2.0.2...v2.0.3
[2.0.2]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v2.0.1...v2.0.2
[2.0.1]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v2.0.0...v2.0.1
[2.0.0]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/bespin-workflows/exomeseq-gatk4/releases/tag/v1.0.0
