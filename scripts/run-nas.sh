#!/bin/bash

# Run NAS
for b in \
  "cg.C" \
  "ep.C" \
  "lu.C" \
  "mg.C" \
  "sp.A"; \
  do
  # Without the tool attached
  printf "%s," "$b"
  for i in {1..50}
  do
    out=$(./"$b")
    gout=($(echo "$out" | grep "Time in seconds"))
    printf "%s," ${gout[4]}
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
    gout=($(echo "$out" | grep "Time in seconds"))
    printf "%s," ${gout[4]}
  done
  printf "\n"
done

################################################################################
