<img src="./images/mdibl-compbio-core-logo-eurostyle.jpg" width=1020 height=262 alt="MDIBL Comp BioCore Logo">

# MDI Biological Laboratory RNA-seq Transcriptome Assembly Module
---------------------------------

## This module has three primary and interlinked learning goals:
1. From a *biological perspective*, demonstration of the **process of transcriptome assembly** from raw RNA-seq data;
2. From a *computational perspective*, demonstration of **computing using workflow management and container systems**.
3. Also from a *computational perspective*, demonstration of **carrying out these analyses efficiently** in a cloud environment (coming as an enhancement).

# Summary
This module teaches you how to perform a short-read RNAseq Transcriptome Assembly using the Google Cloud Platform using a Nextflow pipeline, (eventually) as carried out using the Google Cloud Lifesciences API. In addition to the overview given in this README you will find 3 Jupyter notebooks that teach you different components of RNAseq in the cloud. To use our module, clone the parent repository, `git clone REPO_URL` and then navigate to the directory for this project. You will then see the notebooks in your environment.

In order to successfully run this module, users will need to create a Jupyter Notebook server with at least 16 CPUs, 100GB of RAM.  It was tested successfully using an N1 high-memory node.  The default of 100GB hard drive space for the jupyter partition is adequate for running the examples here, but may need to be made larger if additional analysis is carried out.  

Once the Jupyter Notebook Server has been established, the first step is to open a terminal notebook and clone the project with the command:

**gcloud source repos clone nosi-mdibl-inbrecloud --project=nosi-mdibl-inbrecloud**

[<img align="right" src="./images/tech_infra_diag.png" alt="technical infrastructure" width=800>](./images/tech_infra_diag.png)

## Overview of Page Contents

+ [Getting Started](#GS)
+ [Overview](#OV)
+ [Software Requirements](#SOF)
+ [Workflow Diagrams](#WORK)
+ [Data](#DATA)
+ [Troubleshooting](#TR)
+ [Funding](#FUND)

## **Getting Started** <a name="GS"></a>

This learning module includes tutorials and execution scripts in the form of Jupyter notebooks. The purpose of these tutorials is to help users familiarize themselves with the cloud computing in the specific context of running bioinformatics workflows to prep for and to carry out a transcriptome assembly, refinement, and annotation. These tutorials do this by utilizing a recently pulbished Nexflow workflow (TransPi [manuscript](https://onlinelibrary.wiley.com/doi/10.1111/1755-0998.13593), [repository](https://github.com/palmuc/TransPi), and [user guide](https://palmuc.github.io/TransPi/)), which manages and passes data between several state-of-the-art programs, carrying out the processes from initial quality control and normalization, through assembly with several tools, refinement and assessment, and finally annotation of the final putative transcriptome.

Since the work is managed by this pipeline, the workbooks will focus on setting up and running the pipeline, followed by examination of some of the wide range of outputs produced.  We will also demonstrate how to retrieve the complete results directory, so that users can examine more extensively on their own computing systemsgoing step-by-step through specific workflows. These workflows cover the start to finish of basic bioinformatics analysis; starting from raw sequence data and carrying out the steps needed to generate a final assembled and annotated transcriptome.

We also put an emphasis on understanding how workflows execute, using the specific example of the NextFlow (https://www.nextflow.io) workflow engine, and on using workflow engines as supported by a cloud infrastructure, using the sepcific example of the Google Cloud Lifesciences API (https://cloud.google.com/life-sciences).

The technical infrastructure diagram for this project is shown to the right:
## **Overview** <a name="OV"></a>
### Biological Problem 
The combination of increased availability and reduced expense in obtaining high-throughput sequencing has made transcriptome profiling analysis (primarily with RNAseq) a standard tool for the molecular characterization of widely disparate biological systems.  Researchers working in common model organisms, such as mouse or zebrafish, have relatively easy access to the necessary resources, (e.g., well-assembled genomes and large collections of predicted/verified transcripts), for the analysis and interpretation of their data.  In contrast, researchers working in less commonly studied organisms and systems often must develop these resources for themselves. 

[<img align="right" src="./images/basic_assembly.png" alt="basic transcriptome assembly" width=800>](./images/basic_assembly.png)

“Transcriptome assembly” is the broad term used to describe the process of estimating many (or ideally all) of an organism’s transcriptome based upon the large-scale but fragmentary data provided by high-throughput sequencing.  A “typical” RNA-seq dataset will consist of tens of millions of reads or read-pairs, with each contiguous read representing up to 150 nucleotides in sequence.  Complete transcripts, in contrast, typically range from hundreds to up to tens of thousands of nucleotides in length.  In short, and leaving out the technical details, the process of assembling a transcriptome from raw reads (diagrammed at right) is to first make a "best guess" segregation of the reads into subsets that are most likely derived from one (or a small set of related/similar genes), and then for each subset, build a most-likely set of transcripts and genes.

Once a new transcriptome is generated, assessed, and refined, it must be annotated with putative functional assignments to be of use in subsequent functional studies.  Functional annotation is accomplished through a combination of assignment of homology-based and ab initio methods.  The most well-established homology-based processes are the combination of protein coding sequence prediction followed by protein sequence alignment to databases of known proteins, especially those from human or common model organisms.  Ab initio methods use computational models of various features (e.g., known protein domains, signal peptides, or peptide modification sites) to characterize either the transcript or its predicted protein product.  This training module will cover multiple approaches to the annotation of assembled transcriptomes.

Finally, we will use the same test dataset to carry out a basic differential expression analysis, using the assembled transcriptome as a target, and the source sequence files as input.

## **Software Requirements** <a name="SOF"></a>

To run this module, the critical needs are installation of the nextflow workflow system (https://www.nextflow.io/) and also the google lifescience API.  The first notebook, which can accomplish these installations should only need be executed once per machine.  

The rest of the software needed is all downloaded as part of the nexflow TransPi package (https://github.com/palmuc/TransPi), manual here (https://palmuc.github.io/TransPi/).  TransPi is a nextflow pipeline that carries out many of the standard step required for transcriptome assembly and annotation.  

You will need access to a Jupyter Environment. Some notebooks will require access to the Google Cloud Platform Vertex AI environment. You can install all necessary requirements using the commands in Notebook 1 ([01_prog_setup.ipynb](./01_prog_setup.ipynb).

## **Workflow Diagrams** <a name="WORK"></a>

<img src="images/transpi_workflow.png" width="450" height="300">

**to be continued**

We explain our notebooks that execute these processes here:

+ Notebooks labeled 0 ([00_Background.md](./00_Background.md) and [00_Glossary.md](./00_Glossary.md)) respectively cover background materials and provide a centralized glossary for both the biological problem of transcriptome assembly, as well as an introduction to workflows and container-based computing.
+ Notebook 1 ([01_prog_setup.ipynb](./01_prog_setup.ipynb)) is used for setting up the environment.  It should only need to be run once per machine.
+ Notebook 2 ([02_basic_assembly.ipynb](./02_basic_assembly.ipynb)) carries out a complete run of the Nextflow TransPi assembly workflow on a modest sequence set, producing a small transcriptome.
+ Notebook 3 ([03_annotation_only.ipynb](./03_annotation_only.ipynb)) carries out an annotation-only run using a prebuilt, but more complete transcriptome.
+ Notebook 4 [[not ready yet]] (04_differential_expression.ipynb) uses the transcriptome generated in Notebook2 in conjuction with the orginal individual sample files to carry out a differential expression analysis.
+ Notebook 5 [[not ready yet]] (05_gls_assembly.ipynb) carries out the workflow using the Google Cloud Lifesciences API.

## **Data** <a name="DATA"></a>
The test data set used in the majority of this module is a downsampled version of a dataset that can be obtained in its complete form from the SRA database (Bioproject [**PRJNA318296**](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA318296), GEO Accession [**GSE80221**](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE80221)). The data was originally generated by **Hartig et al., 2016**. We downsampled the data files in order to streamline the performance for the tutorials and stored them in a Google Cloud Storage Bucket. The sub-sampled data, in individual smaple files as well as a concatenated version of these files are available in our Google Cloud Storage bucket at gs://nosi-mdibl-gls-bucket/seq2.

Additional data sets for demostration of the annotation features were obtained from the NCBI Transcriptome Shotgun Assembly archive. 

## **Troubleshooting** <a name="TR"></a>
The most common issue what was encountered during the development of this module was problems in the successful execution of the setup script that was generated by the developers of TransPi.  The prinicipal issue was the retrieval of necessary reference information from external servers, at least two of which were found to be offline during attempted runs of the script.  The end-result was that the script would hang, and due to the order in which the steps were carried out, it would not leave the workflow in a state from which the work could be carried out.

We have worked around this issue by establishing copies of all relevant materials in our own storage bucket.  Notebook 01 now includes instructions for the code necessary to override the failed setup.

## **Funding** <a name="FUND"></a>

MDIBL Computational Biology Core efforts are supported by two Institutional Development Awards (IDeA) from the National Institute of General Medical Sciences of the National Institutes of Health under grant numbers P20GM103423 and P20GM104318.

## **License for Data** <a name="LIC"></a>

Text and materials are licensed under a Creative Commons CC-BY-NC-SA license. The license allows you to copy, remix and redistribute any of our publicly available materials, under the condition that you attribute the work (details in the license) and do not make profits from it. More information is available [here](https://tilburgsciencehub.com/about/#license).

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />

This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

The TransPi Nextflow workflow was developed and released by Ramon Rivera, and can be obtained from its [github repository](https://github.com/PalMuc/TransPi)