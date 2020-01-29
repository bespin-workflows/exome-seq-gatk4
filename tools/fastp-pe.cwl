#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
hints:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/fastp:0.20.0--hdbcaa40_0'
  - class: SoftwareRequirement
    packages:
      fastp:
        version: [ "0.20.0-0" ]
        s:citation: https://doi.org/10.1093/bioinformatics/bty560

inputs:
  read1:
    type: File
    doc: "read1 input file name (string [=])"
    inputBinding:
      prefix: '-i'
  read2:
    type: File
    doc: "read2 input file name (string [=])"
    inputBinding:
      prefix: '-I'
  trimmed_read1_filename:
    type: string
    doc: "read1 output file name (string [=]). The output will be gzip-compressed if its file name ends with .gz"
    inputBinding:
      prefix: '-O'
  trimmed_read2_filename:
    type: string
    doc: "read2 output file name (string [=]). The output will be gzip-compressed if its file name ends with .gz"
    inputBinding:
      prefix: '-o'
  html_report_filename:
    type: string?
    doc: "the html format report file name (string [=fastp.html])"
    inputBinding:
      prefix: '-h'
  json_report_filename:
    type: string?
    doc: "the json format report file name (string [=fastp.json])"
    inputBinding:
      prefix: '-j'
  threads:
    type: int?
    doc: "worker thread number, default is 2 (int [=2])"
    inputBinding:
      prefix: '-w'


outputs:
  trimmed_read1:
    type: File
    outputBinding:
      glob: $(inputs.trimmed_read1_filename)
  trimmed_read2:
    type: File
    outputBinding:
      glob: $(inputs.trimmed_read2_filename)
  html_report:
    type: File
    outputBinding:
      glob: "*.html"
  json_report:
    type: File
    outputBinding:
      glob: "*.json"


baseCommand: fastp

$namespaces:
  s: https://schema.org/

$schemas:
 - https://schema.org/docs/schema_org_rdfa.html

# CPUs: same as threads. mem usage: 1.1GB
