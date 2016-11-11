#include <stdio.h>
#include <math.h>

//#define PI 3.14159162
#define PI (acos(-1))

#define Nsteps 100

double f1(double v0, double v1, double v2) {
  return(sin(v0)/4);
};

double f2(double v0, double v1, double v2) {
  return(sin(v0)*sin(v0)*sin(v1));
};

double integrate(double &sw(), int vars, double mx0, double mx1, double mx2, int N)
{
  int i,j,k;
  double ret = 0;

  double factor;
  switch (vars)
    {
    case 1:
      factor = mx0 * mx1 * mx2 / N;
      break;
    case 2:
      factor = mx0 * mx1 * mx2 / (N*N);
      break;
    case 3:
      factor = mx0 * mx1 * mx2 / (N*N*N);
      break;
    default:
      printf("integrate(): vars must be between 1 and 3\n");
      exit(-1);
    };

  for(i=0; i < N; ++i) {
    if(vars > 1) {
      for(j=0; j < N; ++j) {
	if(vars > 2) {
	  for(k=0; k < N; ++k) {
	    ret += factor * (sw?f1(mx0 * i / N,
				  mx1 * j / N,
				  mx2 * k / N):f2(mx0 * i / N,
						  mx1 * j / N,
						  mx2 * k / N));
	  }
	}else{
	  ret += factor * (sw?f1(mx0 * i / N,
				mx1 * j / N,
				0):f2(mx0 * i / N,
						mx1 * j / N,
						0));
	}
      }
    }else{
      ret += factor * (sw?f1(mx0 * i / N,
			    0,
			    0):f2(mx0 * i / N,
				  0,
				  0));
    };
  };
  return(ret);
};

     
main(int argc, char **argv)
{
  double out1 = integrate(&f1, 3, PI, 2*PI, 2*PI, Nsteps);
  printf("out1 =    \t%lf\n", out1);
  out1 = integrate(&f1, 2, PI, 2*PI, 2*PI, Nsteps);
  printf("out1 =    \t%lf\n", out1);
  out1 = integrate(&f1, 1, PI, 2*PI, 2*PI, Nsteps);
  printf("out1 =    \t%lf\n", out1);
  double out2 = integrate(&f2, 3, 2*PI, PI, PI, Nsteps);
  printf("out2 =    \t%lf\n", out2);
  printf("answer = \t%lf\n", 2 * PI * PI);
};
