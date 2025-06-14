## Contents

+ [Overview](#overview)
+ [Learning goals](#learning-goals)
+ [Biological Problem](#biological-problem)
+ [Architecture Diagram](#architecture-diagram)
+ [Data](#data)
+ [Troubleshooting](#troubleshooting)
+ [Funding](#funding)
+ [License for Data](#license-for-data)

## Overview
This module teaches you how to perform a short-read RNA-seq Transcriptome Assembly on Amazon Web Services (AWS) using a Nextflow pipeline. 

## Learning goals:
1. From a *biological perspective*, demonstration of the **process of transcriptome assembly** from raw RNA-seq data.
2. From a *computational perspective*, demonstration of **computing using workflow management and container systems**.
3. Also from an *infrastructure perspective*, demonstration of **carrying out these analyses efficiently in a cloud environment.**

## **Biological Problem**
The combination of increased availability and reduced expense in obtaining high-throughput sequencing has made transcriptome profiling analysis (primarily with RNA-seq) a standard tool for the molecular characterization of widely disparate biological systems. Researchers working in common model organisms, such as mouse or zebrafish, have relatively easy access to the necessary resources (e.g., well-assembled genomes and large collections of predicted/verified transcripts), for the analysis and interpretation of their data. In contrast, researchers working on less commonly studied organisms and systems often must develop these resources for themselves.

Transcriptome assembly is the broad term used to describe the process of estimating many (or ideally all) of an organism’s transcriptome based on the large-scale but fragmentary data provided by high-throughput sequencing. A "typical" RNA-seq dataset will consist of tens of millions of reads or read-pairs, with each contiguous read representing up to 150 nucleotides in the sequence. Complete transcripts, in contrast, typically range from hundreds to tens of thousands of nucleotides in length. In short, and leaving out the technical details, the process of assembling a transcriptome from raw reads (Figure 2) is to first make a "best guess" segregation of the reads into subsets that are most likely derived from one (or a small set of related/similar genes), and then for each subset, build a most-likely set of transcripts and genes.

![basic transcriptome assembly](../images/basic_assembly.png)

**Figure 2:** The process from raw reads to first transcriptome assembly.

Once a new transcriptome is generated, assessed, and refined, it must be annotated with putative functional assignments to be of use in subsequent functional studies.  Functional annotation is accomplished through a combination of assignment of homology-based and ab initio methods. The most well-established homology-based processes are the combination of protein-coding sequence prediction followed by protein sequence alignment to databases of known proteins, especially those from human or common model organisms. Ab initio methods use computational models of various features (e.g., known protein domains, signal peptides, or peptide modification sites) to characterize either the transcript or its predicted protein product. This training module will cover multiple approaches to the annotation of assembled transcriptomes.

## **Architecture Diagram**

![nf-core workflow](../images/Transcriptome_Assembly_Maine_AWS.svg)

## **Data** 
The test dataset used in the majority of this module is a downsampled version of a dataset that can be obtained in its complete form from the SRA database (Bioproject [**PRJNA318296**](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA318296), GEO Accession [**GSE80221**](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE80221)). The data was originally generated by **Hartig et al., 2016**. We downsampled the data files in order to streamline the performance of the tutorials and stored them in an s3 bucket. The sub-sampled data, in individual sample files as well as a concatenated version of these files are available in our s3 bucket at `s3://nigms-sandbox/nosi-inbremaine-storage/resources/seq2`.

Additional datasets for demonstration of the annotation features of TransPi were obtained from the NCBI Transcriptome Shotgun Assembly archive. These files can be found in our Google Cloud Storage bucket at `s3://nigms-sandbox/nosi-inbremaine-storage/resources/trans`.
- Microcaecilia dermatophaga 
    - Bioproject: [**PRJNA387587**](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA387587)
    - Originally generated by **Torres-Sánchez M et al., 2019**. 
- Oncorhynchus mykiss
    - Bioproject: [**PRJNA389609**](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA389609)
    - Originally generated by **Wang J et al., 2016**, **Al-Tobasei R et al., 2016**, and **Salem M et al., 2015**. 
- Pseudacris regilla
    - Bioproject: [**PRJNA163143**](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA163143)
    - Originally generated by **Laura Robertson, USGS**. 
- Apis mellifera
    - Bioproject: [**PRJNA274674**](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA274674)
    - Originally generated by **Galbraith DA et al., 2015**.

## **Getting Started**

This repository contains several Jupyter notebook files which serve as bioinformatics WGBS workflow tutorials. To view these notebooks on AWS, the following steps will guide you through setting up a notebook instance on SageMaker AI, downloading our tutorial files, and running those files.

### Creating a notebook instance

**1)** Follow the steps highlighted [here](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAWSSagemakerNotebooks.md) to create a new notebook instance in Amazon SageMaker. Follow steps and be especially careful to enable idle shutdown as highlighted. For this module, in [step 4](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAWSSagemakerNotebooks.md) in the "Notebook instance type" tab, select ml.m5.xlarge from the dropdown box. Select conda_python3 kernel in [step 8](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAWSSagemakerNotebooks.md).

**2)** You will need to download the tutorial files from GitHub. The easiest way to do this would be to clone the repository from NIGMS into your Amazon SageMaker notebook. To clone this repository, use the Git symbole on left menu and then insert the link `https://github.com/NIGMS/Transcriptome-Assembly-Refinement-and-Applications.git` as it is illustrated in [step 7](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAWSSagemakerNotebooks.md). Please make sure you only enter the link for the repository that you want to clone. There are other bioinformatics related learning modules available in the [NIGMS Repository](https://github.com/NIGMS). This will download our tutorial files into a folder called `Transcriptome-Assembly-Refinement-and-Applications`.

### Running Tutorial Files

All our tutorial workflows are in [Jupyter notebook](https://docs.jupyter.org/en/latest/ "Juypter notebook documentation") format. To run these notebooks (.ipynb) you need only to double-click the tutorial files and this will open the Jupyter file in Jupyter notebook. From here you can run each section, or 'cell', of the code, one by one, by pushing the 'Play' button on the above menu.

Some 'cells' of code take longer for the computer to process than others. You will know a cell is running when a cell has an asterisk next to it **[*]**. When the cell finishes running, that asterisk will be replaced with a number which represents the order that cell was run in.

### Stopping Your Notebook

Make sure that after you are done with the module, close the tab that appeared when you clicked **OPEN JUPYTERLAB**, then check the box next to the name of the notebook you created in [step 3](https://github.com/NIGMS/NIGMS-Sandbox/blob/main/docs/HowToCreateAWSSagemakerNotebooks.md). Then click on **STOP** at the top of the Workbench menu. Wait and make sure that the icon next to your notebook is grayed out.

## **Troubleshooting**
- If a quiz is not rendering:
    - Make sure the `pip install` cell was executed in Submodule 1.
    - Try re-executing `from jupytercards import display_flashcards` or `from jupyterquiz import display_quiz` depending on the quiz type. 
- If a file/directory is not able to be found, make sure that you are in the right directory. If the notebook is idle for a long time, gets reloaded, or restarted, you will need to re-run Step 1 of the notebook. (`%cd /home/jupyter`)
- Sometimes, Nextflow will print `WARN:` followed by the warning. These are okay and should not produce any errors.
- Sometimes Nextflow will print `Waiting for file transfers to complete`. This may take a few minutes, but is nothing to worry about.
- If you are unable to interact with your s3 bucket using the `aws s3` command, check your `nextflow-service-account` roles. Make sure that you have `Storage Admin` added.
- If you are trying to execute a terminal command in a Jupyter code cell and it is not working, make sure that you have an `!` before the command.
    - e.g., `mkdir example-1` -> `!mkdir example-1`

## AWS Bedrock (Optional)

Generative AI is available for this tutorial if you would like to use it. To run it, please reference Submodule 1, or run the following code within a submodule notebook.

```!pip install -q ipywidgets
import sys
import os
util_path = os.path.join(os.getcwd(), 'util')
if util_path not in sys.path:
    sys.path.append(util_path)

# Import the display_widgets function from your Python file
from genai import display_widgets

# Call the function to display the widgets
display_widgets()