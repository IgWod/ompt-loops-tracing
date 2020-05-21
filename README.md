# Introduction

Artifacts code for the paper: "Aftermath and OMPT: Loops and Tasks Tracing Using OMPT" 

# Requirements

All customized code can be found in the following repositories:

* https://github.com/pepperpots/llvm-project-openmp (branch: iwomp2020)
* https://github.com/LangdalP/clang (branch: pedervl/static-chunks-conditional)
* https://github.com/pepperpots/aftermath (branch: iwomp2020)
* https://github.com/pepperpots/Afterompt (tag: iwomp2020)

# Building

The following steps show how to build all components required for the
complete tracing of loops and tasks.

## Aftermath

Simply clone the Aftermath from here https://github.com/pepperpots/aftermath
(branch: iwomp2020) and build it following the standard steps from
[here](https://www.aftermath-tracing.com/prerelease/)

## OpenMP Runtime

Clone the full LLVM project from [here](https://github.com/llvm/llvm-project).
Checkout `llvmorg-9.0.0` tag and replace `openmp` directory with the
customized runtime. Then build everything as normal.

## Afterompt

Simply follow instructions in the repository.

## Clang

Clone LLVM project archive from [here](https://github.com/llvm-mirror/llvm.git).
Checkout `release_40` tag. Then clone the customized Clang repository
(brnach: pedervl/static-chunks-conditional) into `tools` directory.
In the root CMake in LLVM_ALL_TARGETS remove all targets, but X86.
There are some weird failures for some ARM targets, so it is the easiest
way to get it to build. Build LLVM project as normal.
