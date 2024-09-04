#!/bin/sh

export SHMEM_DISABLE_MULTIRAIL=1
export FI_CXI_DEFAULT_CQ_SIZE=131072
export FI_PROVIDER=cxi
export FI_CXI_OPTIMIZED_MRS=0
export EnableImplicitScaling=0
mpiexec -n 1 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -t device -m 4194304 > tmp_1
cat tmp_1 | awk {'printf("%ld\t%lf\n", $19, $26)'} > tmp_same

mpiexec -n 2 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -t device -m 4194304 > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_tile

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -t device -m 4194304 > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_device

paste tmp_same tmp_tile tmp_device > ishmem_put

mpiexec -n 1 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/get_bw -t device -m 4194304 > tmp_1
cat tmp_1 | awk {'printf("%ld\t%lf\n", $19, $26)'} > tmp_same

mpiexec -n 2 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/get_bw -t device -m 4194304 > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_tile

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/get_bw -t device -m 4194304 > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_device

paste tmp_same tmp_tile tmp_device > ishmem_get
