process TRINOTATE {
    tag "$meta.id"
    label 'process_high'

    conda "bioconda::trinotate=3.2.2"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/trinotate:3.2.2--pl526_1' :
        'quay.io/biocontainers/trinotate:3.2.2--pl526_1' }"

    input:
    tuple val(meta), path(transcripts), path(protein)
    path(trinotate_db)

    output:
    tuple val(meta), path("*.trinotate_annotation_report.txt"), emit: report
    path "versions.yml", emit: versions

    script:
    def args = task.ext.args ?: ''
    """
    Trinotate $trinotate_db --transcript $transcripts --protein $protein $args

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        trinotate: \$(Trinotate --version 2>&1 | sed 's/^Trinotate: //')
    END_VERSIONS
    """
}