#ifndef MMULT_ACC_H_
#define MMULT_ACC_H_

#define A_NROWS 32
#define A_NCOLS 32
#define B_NCOLS 32
#define B_NROWS A_NCOLS

void mmult_accel (float in_A[A_NROWS*A_NCOLS],
                  float in_B[A_NCOLS*B_NCOLS],
                  float out_C[A_NROWS*B_NCOLS]);

void _p0_mmult_accel_0 (float in_A[A_NROWS*A_NCOLS],
                        float in_B[A_NCOLS*B_NCOLS],
                        float out_C[A_NROWS*B_NCOLS]);

#endif /* MMULT_ACC_H_ */
