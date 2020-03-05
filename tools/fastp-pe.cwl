#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: InlineJavascriptRequirement

hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/fastp:0.20.0--hdbcaa40_0'
  - class: SoftwareRequirement
    packages:
      fastp:
        version: [ "0.20.0" ]
        s:citation: https://doi.org/10.1093/bioinformatics/bty560

inputs:
  reads:
    type: File[]
    doc: "read1 and read2 input files array"
  trimmed_reads_filenames:
    type: string[]
    doc: "Array of output file names. The output will be gzip-compressed if its file name ends with .gz"
  report_base_filename:
    type: string
    doc: "Prefix to use for HTML and JSON report files"
  detect_adapter_for_pe:
    type: boolean
    doc: "By default, the adapter sequence auto-detection is enabled for SE data only turn on this option to enable it for PE data"
    default: true
    inputBinding:
      prefix: '--detect_adapter_for_pe'
  threads:
    type: int?
    doc: "worker thread number, default is 2 (int [=2])"
    inputBinding:
      prefix: '-w'

outputs:
  trimmed_reads:
    type: File[]
    outputBinding:
      glob: $(inputs.trimmed_reads_filenames)
  html_report:
    type: File
    outputBinding:
      glob: $(inputs.report_base_filename + ".html")
  json_report:
    type: File
    outputBinding:
      glob: $(inputs.report_base_filename + ".json")

baseCommand: fastp
arguments:
  - "-I"
  - $(inputs.reads[0])
  - "-i"
  - $(inputs.reads[1])
  - "-O"
  - $(inputs.trimmed_reads_filenames[0])
  - "-o"
  - $(inputs.trimmed_reads_filenames[1])
  - "-j"
  - $(inputs.report_base_filename + ".json")
  - "-h"
  - $(inputs.report_base_filename + ".html")

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
