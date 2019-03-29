# Version History: exomeseq-gatk4

All notable changes to this workflow will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2019-03-29

### Added

- Initial release of exomeseq-gatk4.cwl variant calling workflow
- Adds JSON tool examples for several of the GATK4 tools (with embedded file contents)

### Changed

- Adds HaplotypeCaller step to exomeseq-gatk4-preprocessing workflow
- Removes unnecessary steps in preprocessing
- Moves custom CWL types into individual files
- Optimizes the concat-gz-files step to skip recompression on single files

## [1.0.0] - 2019-03-29

### Added

- Initial release of exomeseq-gatk4 preprocessing workflow, migrated from exomeseq-gatk4-preprocessing.cwl in [bespin-cwl v0.9.4](https://github.com/Duke-GCB/bespin-cwl/releases/tag/v0.9.4)

[Unreleased]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v2.0.0...release-2.0
[2.0.0]: https://github.com/bespin-workflows/exomeseq-gatk4/compare/v2.0.0...v1.0.0
[1.0.0]: https://github.com/bespin-workflows/exomeseq-gatk4/releases/tag/v1.0.0
