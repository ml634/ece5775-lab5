#ifndef MMULT_ACC_H_
#define MMULT_ACC_H_

typedef float data_t;

#define A_NROWS 32
#define A_NCOLS 32
#define B_NCOLS 32
#define B_NROWS A_NCOLS

#pragma SDS data copy(in_A[0:dim1*dim1])
#pragma SDS data copy(in_B[0:dim1*dim1])
#pragma SDS data copy(out_C[0:dim1*dim1])
#pragma SDS data access_pattern(in_A:SEQUENTIAL, in_B:SEQUENTIAL, out_C:SEQUENTIAL)
void mmult_accel (data_t in_A[A_NROWS*A_NCOLS],
                  data_t in_B[A_NCOLS*B_NCOLS],
                  data_t out_C[A_NROWS*B_NCOLS],
                  int dim1);

#endif /* MMULT_ACC_H_ */
