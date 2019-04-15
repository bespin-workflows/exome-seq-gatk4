#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  - $import: GATK4-docker-requirements.yml
  - class: InlineJavascriptRequirement
hints:
  - $import: GATK4-hints.yml
baseCommand: gatk

inputs:
  reference:
    type: File
    inputBinding:
      prefix: -R
    secondaryFiles:
    - .amb
    - .ann
    - .bwt
    - .pac
    - .sa
    - .fai
    - ^.dict
    doc: Reference sequence file  Required.
  output_vcf_filename:
    type: string
    inputBinding:
      prefix: --output
    doc: File to which variants should be written  Required.
  variants:
    type:
      type: array
      items: File
      inputBinding:
        prefix: "--variant"
    secondaryFiles:
    - .idx

outputs:
  output_vcf:
    type: File
    outputBinding:
      glob: $(inputs.output_vcf_filename)
    secondaryFiles:
      - .idx

arguments:
- valueFrom: CombineGVCFs
  position: 0
