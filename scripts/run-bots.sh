#!/bin/bash

# Run BOTS
for b in \
  "fft.clang.omp-tasks-tied" \
  "nqueens.clang.omp-tasks-tied" \
  "sort.clang.omp-tasks-tied" \
  "sparselu.clang.for-omp-tasks-tied" \
  "strassen.clang.omp-tasks-tied"; \
  do
  # Without the tool attached
  printf "%s," "$b"
  for i in {1..50}
  do
    out=$(./"$b")
    gout=($(echo "$out" | grep "Time Program"))
    printf "%s," ${gout[3]}
  done
  printf "\n"

  # With the tool attached
  printf "%s," "$b"
  for i in {1..50}
  do
    out=$(AFTERMATH_TRACE_FILE=trace.ost \
    LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LLVM_LIBRARY_PATH}:${AFTEROMPT_LIB_PATH} \
    LD_PRELOAD=${LLVM_LIBRARY_PATH}/libomp.so:${AFTEROMPT_LIBRARY_PATH}/libafterompt.so \
    ./"$b")
    gout=($(echo "$out" | grep "Time Program"))
    printf "%s," ${gout[3]}
  done
  printf "\n"
done

################################################################################

# Without the tool attached
printf "%s," "alignment.clang.for-omp-tasks-tied -f inputs/alignment/prot.100.aa"
for i in {1..50}
do
  out=$(./alignment.clang.for-omp-tasks-tied -f inputs/alignment/prot.100.aa)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

# With the tool attached
printf "%s," "alignment.clang.for-omp-tasks-tied -f inputs/alignment/prot.100.aa"
for i in {1..50}
do
  out=$(AFTERMATH_TRACE_FILE=trace.ost \
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LLVM_LIBRARY_PATH}:${AFTEROMPT_LIB_PATH} \
  LD_PRELOAD=${LLVM_LIBRARY_PATH}/libomp.so:${AFTEROMPT_LIBRARY_PATH}/libafterompt.so \
  ./alignment.clang.for-omp-tasks-tied -f inputs/alignment/prot.100.aa)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

################################################################################

# Without the tool attached
printf "%s," "floorplan.clang.omp-tasks-tied -f inputs/floorplan/input.20"
for i in {1..50}
do
  out=$(./floorplan.clang.omp-tasks-tied -f inputs/floorplan/input.20)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

# With the tool attached
printf "%s," "floorplan.clang.omp-tasks-tied -f inputs/floorplan/input.20"
for i in {1..50}
do
  out=$(AFTERMATH_TRACE_FILE=trace.ost \
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LLVM_LIBRARY_PATH}:${AFTEROMPT_LIB_PATH} \
  LD_PRELOAD=${LLVM_LIBRARY_PATH}/libomp.so:${AFTEROMPT_LIBRARY_PATH}/libafterompt.so \
  ./floorplan.clang.omp-tasks-tied -f inputs/floorplan/input.20)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

################################################################################

# Without the tool attached
printf "%s," "health.clang.omp-tasks-tied -f inputs/health/large.input"
for i in {1..50}
do
  out=$(./health.clang.omp-tasks-tied -f inputs/health/large.input)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

# With the tool attached
printf "%s," "health.clang.omp-tasks-tied -f inputs/health/large.input"
for i in {1..50}
do
  out=$(AFTERMATH_TRACE_FILE=trace.ost \
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LLVM_LIBRARY_PATH}:${AFTEROMPT_LIB_PATH} \
  LD_PRELOAD=${LLVM_LIBRARY_PATH}/libomp.so:${AFTEROMPT_LIBRARY_PATH}/libafterompt.so \
  ./health.clang.omp-tasks-tied -f inputs/health/large.input)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

################################################################################

# Without the tool attached
printf "%s," "fib.clang.omp-tasks-tied -n 30"
for i in {1..50}
do
  out=$(./fib.clang.omp-tasks-tied -n 30)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

# With the tool attached
printf "%s," "fib.clang.omp-tasks-tied -n 30"
for i in {1..50}
do
  out=$(AFTERMATH_TRACE_FILE=trace.ost \
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LLVM_LIBRARY_PATH}:${AFTEROMPT_LIB_PATH} \
  LD_PRELOAD=${LLVM_LIBRARY_PATH}/libomp.so:${AFTEROMPT_LIBRARY_PATH}/libafterompt.so \
  ./fib.clang.omp-tasks-tied -n 30)
  gout=($(echo "$out" | grep "Time Program"))
  printf "%s," ${gout[3]}
done
printf "\n"

################################################################################
