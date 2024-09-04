#!/bin/sh

export SHMEM_DISABLE_MULTIRAIL=1
export FI_CXI_DEFAULT_CQ_SIZE=131072
export FI_PROVIDER=cxi
export FI_CXI_OPTIMIZED_MRS=0
export EnableImplicitScaling=0

// apply patch for cutover never

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1' > tmp_1
cat tmp_1 | awk {'printf("%ld\t%lf\n", $19, $26)'} > tmp_t1

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 16' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t16

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 128' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t128

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1024' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t1024

paste tmp_t1 tmp_t16 tmp_t128 tmp_1024 > ishmem_cutover_never

// apply patch for cutover always

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1' > tmp_1
cat tmp_1 | awk {'printf("%ld\t%lf\n", $19, $26)'} > tmp_t1

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 16' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t16

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 128' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t128

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1024' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t1024

paste tmp_t1 tmp_t16 tmp_t128 tmp_1024 > ishmem_cutover_always

// apply patch for production

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1' > tmp_1
cat tmp_1 | awk {'printf("%ld\t%lf\n", $19, $26)'} > tmp_t1

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 16' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t16

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 128' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t128

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1024' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $26)'} > tmp_t1024

paste tmp_t1 tmp_t16 tmp_t128 tmp_1024 > ishmem_put_wg_bw

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1' > tmp_1
cat tmp_1 | awk {'printf("%ld\t%lf\n", $19, $23)'} > tmp_t1

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 16' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $23)'} > tmp_t16

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 128' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $23)'} > tmp_t128

mpiexec -n 3 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/put_bw -m 4194304 | grep 'test put_bw' | grep 'threads 1024' > tmp_1
cat tmp_1 | awk {'printf("%lf\n", $23)'} > tmp_t1024

paste tmp_t1 tmp_t16 tmp_t128 tmp_1024 > ishmem_put_wg_lat
