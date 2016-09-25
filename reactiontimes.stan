data {
  int<lower=0> N; // number of Observations total
  real<lower=0> y[N]; //reaction time observations
  
  real<lower=0> sigma[J]; // s.e. of effect estimates 
}

parameters {
  real mu; 
  real<lower=0> tau;
  real eta[J];
  real<lower=0> times[N];
}

transformed parameters {
  real sigma2 = 1/tau;
}

model {
  tau ~ gamma(0.001, 0.001);
  y ~ normal(theta, sigma);
}
