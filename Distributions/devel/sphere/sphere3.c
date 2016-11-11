#include <stdio.h>
#include <math.h>

//#define PI 3.14159162
#define PI (acos(-1))

#define Nsteps 100

double f1(double v0, double v1, double v2, double* parms) {
  return(sin(v0)/4);
};

double f2(double v0, double v1, double v2, double* parms) {
  return(sin(v0)*sin(v0)*sin(v1));
};

double f_1dof(double v0, double v1, double v2, double* parms) {
  double s0 = sin(v0);
  double s02 = sin(v0/2.0);
  return((s0 * exp(-*parms * s02 *s02))/4);
};

double f_2dof(double v0, double v1, double v2, double* parms) {
  double s0 = sin(v0);
  double s02 = sin(v0/2.0);
  double c1 = cos(v1);
  return((s0 * exp(-*parms * c1 * c1 * s02 *s02))/4);
};

double integrate(double func(double, double, double, double *), int vars, double mx0, double mx1, double mx2, int N, double* parms)
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
	    ret += factor * (*func)(mx0 * i / N,
				  mx1 * j / N,
				  mx2 * k / N,
				    parms);
	  }
	}else{
	  ret += factor * (*func)(mx0 * i / N,
				mx1 * j / N,
				  mx2,
				  parms);
	}
      }
    }else{
      ret += factor * (*func)(mx0 * i / N,
			      mx1,
			      mx2,
			      parms);
    };
  };
  return(ret);
};

#define EPSILON .00001
     
main(int argc, char **argv)
{
  double k, k2;
  double derivative;
  double out1, out2;

  /*
  out1 = integrate(&f1, 3, PI, 2*PI, 2*PI, Nsteps, NULL);
  printf("out1 =    \t%lf\n", out1);
  out1 = integrate(&f1, 2, PI, 2*PI, 2*PI, Nsteps, NULL);
  printf("out1 =    \t%lf\n", out1);
  */
  out1 = integrate(&f1, 1, PI, 2*PI, 2*PI, Nsteps, NULL);
  printf("out1 =    \t%lf\n", out1);

  /*
  out2 = integrate(&f2, 3, 2*PI, PI, PI, Nsteps, NULL);
  printf("out2 =    \t%lf\n", out2);
  */
  printf("answer = \t%lf\n", 2 * PI * PI);

  // 2-dof integral (Gaussian)
  k = 0;
  out1 = integrate(&f_2dof, 2, PI, 2*PI, 2*PI, Nsteps, &k);
  printf("Gaussian: %lf\n", out1);

  for(k = 0; k > -50; k-=1) {
    // out1 = integrate(&f_1dof, 1, PI, 2*PI, 2*PI, Nsteps, &k);
    out1 = integrate(&f_2dof, 2, PI, 2*PI, 2*PI, Nsteps, &k);

    k2 = k+EPSILON;
    //out2 = integrate(&f_1dof, 1, PI, 2*PI, 2*PI, Nsteps, &k2);
    out2 = integrate(&f_2dof, 2, PI, 2*PI, 2*PI, Nsteps, &k2);
    derivative = (1/out2-1/out1)/EPSILON;
    printf("%11.5lf\t%11.5lf\t%11.5lf%11.5lf\n", k, 1/out1, derivative, derivative*out1);
  };
  /*
  while(1) {
    printf("=> ");
    if(scanf("%lf", &k) == 1) {
      printf("out = %lf %lf\n", out1, 1/out1);
    };
  };
  */
};
