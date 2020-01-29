#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  fastp_html_reports: File[]
  fastp_json_reports: File[]
  bams_markduplicates: File[]
  metrics_markduplicates: File[]
  raw_variants: File[]
  bams_recalibrated: File[]
outputs:
  fastp_html_reports_dir:
    type: Directory
    outputSource: org_fastp_html_reports/outdir
  fastp_json_reports_dir:
    type: Directory
    outputSource: org_fastp_json_reports/outdir
  trim_reports_dir:
    type: Directory
    outputSource: org_trim_reports/outdir
  bams_markduplicates_dir:
    type: Directory
    outputSource: org_bams_markduplicates/outdir
  metrics_markduplicates_dir:
    type: Directory
    outputSource: org_metrics_markduplicates/outdir
  raw_variants_dir:
    type: Directory
    outputSource: org_raw_variants/outdir
  bams_recalibrated_dir:
    type: Directory
    outputSource: org_bams_recalibrated/outdir
steps:
  org_fastp_html_reports:
    run: ../utils/files-to-directory.cwl
    in:
      name:
        default: 'fastp-html-reports'
      files: fastp_html_reports
    out:
      - outdir
  org_fastp_json_reports:
    run: ../utils/files-to-directory.cwl
    in:
      name:
        default: 'fastp-json-reports'
      files: fastp_json_reports
    out:
      - outdir
  org_bams_markduplicates:
    run: ../utils/files-to-directory.cwl
    in:
      name:
        default: 'bams-markduplicates'
      files: bams_markduplicates
    out:
      - outdir
  org_metrics_markduplicates:
    run: ../utils/files-to-directory.cwl
    in:
      name:
        default: 'metrics-markduplicates'
      files: metrics_markduplicates
    out:
      - outdir
  org_raw_variants:
    run: ../utils/files-to-directory.cwl
    in:
      name:
        default: 'gvcfs'
      files: raw_variants
    out:
      - outdir
  org_bams_recalibrated:
    run: ../utils/files-to-directory.cwl
    in:
      name:
        default: 'bams-recalibrated'
      files: bams_recalibrated
    out:
      - outdir

