# Introduction

Artifacts for the paper: "Aftermath and OMPT: Loops and Tasks Tracing Using OMPT".
To cite us please use the following BibTeX entry:

```
Work-in-progress
```

# Repository structure:

* `bin` - Compiled benchmarks used for case studies.
* `license` - Licenses for the files in this repository.
* `results` - Results from the overhead analysis.
* `scripts` - Scripts used to run benchmarks for the overhead analysis.
* `src` - Source files for benchmarks from the `bin` directory.
* `traces` - Trace files of benchmarks from the `bin` directory.

# Software

Following software was used to obtain results for this paper:

* LLVM OpenMP Runtime https://github.com/pepperpots/llvm-project-openmp (branch: iwomp2020)
* Clang https://github.com/LangdalP/clang (branch: pedervl/static-chunks-conditional)
* Aftermath https://github.com/pepperpots/aftermath (branch: iwomp2020)
* Afterompt https://github.com/pepperpots/Afterompt (tag: iwomp2020)

# Building

This section shows how to build all components from the previous section.

## Aftermath

Official steps described [here](https://www.aftermath-tracing.com/prerelease/)
can be used.

## OpenMP Runtime

The OpenMP runtime has to be built in-tree with following steps:

* Clone the full LLVM project from [here](https://github.com/llvm/llvm-project).
* Checkout the `llvmorg-9.0.0` tag.
* Replace `openmp` directory with the customized one.
* Follow standard instruction for building LLVM OpenMP runtime.

## Afterompt

The instruction for building the library can be find in its repository.

## Clang

Clang has to be built using the old LLVM repository as follows:

* Clone LLVM project archive from [here](https://github.com/llvm-mirror/llvm.git).
* Checkout the `release_40` tag.
* Clone the customized Clang repository into `tools` directory.
* In the root CMake file remove all targets, but X86 from LLVM_ALL_TARGETS. This
is necessary to avoid some compile errors caused by (most probably) ARM backend.
* Follow standard building instructions for the repository.

# Licensing

The files in this repository use following licenses:

* SparseLU binaries and source code are published under the GPL-2.0 license.
* IS binaries and source code are published under the NASA Open Source Agreement v1.3.
* Scripts, traces and results are published under the MIT license.
