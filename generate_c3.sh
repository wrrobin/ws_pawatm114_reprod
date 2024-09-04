#!/bin/sh

export SHMEM_DISABLE_MULTIRAIL=1
export FI_CXI_DEFAULT_CQ_SIZE=131072
export FI_PROVIDER=cxi
export FI_CXI_OPTIMIZED_MRS=0
export EnableImplicitScaling=0

// patch for cutover never

# fcollect
mpiexec -n 4 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 16' > tmp
cat tmp | awk {'printf("%ld\t%lf\n", $20, $24)'} > tmp_t16

mpiexec -n 4 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t64

mpiexec -n 4 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 256' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t256

mpiexec -n 4 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 1024' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t1024

// patch for cutover always

mpiexec -n 4 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_always

paste tmp_t16 tmp_t64 tmp_t256 tmp_t1024 tmp_always > fcollect_4

mpiexec -n 8 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 16' > tmp
cat tmp | awk {'printf("%ld\t%lf\n", $20, $24)'} > tmp_t16

mpiexec -n 8 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t64

mpiexec -n 8 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 256' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t256

mpiexec -n 8 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 1024' > tmpcat tmp | awk {'printf("%lf\n", $24)'} > tmp_t1024

// patch for cutover always

mpiexec -n 8 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_always

paste tmp_t16 tmp_t64 tmp_t256 tmp_t1024 tmp_always > fcollect_8

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 16' > tmp
cat tmp | awk {'printf("%ld\t%lf\n", $20, $24)'} > tmp_t16

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t64

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 256' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t256

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 1024' > tmpcat tmp | awk {'printf("%lf\n", $24)'} > tmp_t1024

// patch for cutover always

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_always

paste tmp_t16 tmp_t64 tmp_t256 tmp_t1024 tmp_always > fcollect_12



// patch for cutover production

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 16' > tmp
cat tmp | awk {'printf("%ld\t%lf\n", $20, $24)'} > tmp_t16

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_t64

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 256' > tmpcat tmp | awk {'printf("%lf\n", $24)'} > tmp_t256

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 1024' > tmpcat tmp | awk {'printf("%lf\n", $24)'} > tmp_t1024

// patch for cutover always

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/fcollect_bw -w 1024 | grep 'test fcollect_bw' | grep 'group' | grep 'threads 64' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_always

paste tmp_t16 tmp_t64 tmp_t256 tmp_t1024 tmp_always > fcollect

# broadcast
mpiexec -n 2 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/broadcast_bw -w 128 | grep 'test broadcast_bw' | grep 'group' | grep 'threads 128' > tmp

cat tmp | awk {'printf("%ld\t%lf\n", $20, $24)'} > tmp_n2

mpiexec -n 4 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/broadcast_bw -w 128 | grep 'test broadcast_bw' | grep 'group' | grep 'threads 128' > tmp

cat tmp | awk {'printf("%lf\n", $24)'} > tmp_n4

mpiexec -n 6 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/broadcast_bw -w 128 | grep 'test broadcast_bw' | grep 'group' | grep 'threads 128' > tmp

cat tmp | awk {'printf("%lf\n", $24)'} > tmp_n6

mpiexec -n 8 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/broadcast_bw -w 128 | grep 'test broadcast_bw' | grep 'group' | grep 'threads 128' > tmp

cat tmp | awk {'printf("%lf\n", $24)'} > tmp_n8

mpiexec -n 10 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/broadcast_bw -w 128 | grep 'test broadcast_bw' | grep 'group' | grep 'threads 128' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_n10

mpiexec -n 12 $ISHMEM_BUILD_DIR/../scripts/ishmrun $ISHMEM_BUILD_DIR/test/performance/broadcast_bw -w 128 | grep 'test broadcast_bw' | grep 'group' | grep 'threads 128' > tmp
cat tmp | awk {'printf("%lf\n", $24)'} > tmp_n12

paste tmp_n2 tmp_n4 tmp_n6 tmp_n8 tmp_n10 tmp_n12 > broadcast
