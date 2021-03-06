// What is provided? reaction times
data {
  // number of frequencies total
  //int<lower=0> N;
  //reaction time observations, distr. to some function
  
  //observed frequencies
  //int freqs[N];
  //assumes sorted (lo -> hi) & least 2 equidistant bins 
  //vector[N] bins;
  //real<lower=0> bin_radius;
  // number of Observations total
  int<lower=0> total;
  vector[total] y;
  int<lower=0> star_size;
}


parameters {
  real<lower=0> alpha;
  real<lower=0> sigma;
  real<lower=0> mu_n;
  real<lower=0> sigma_n;
  real<lower=0> mu_e;
  real<lower=0> sigma_e;
  real<lower=0> lambda_e;
}


model {
  
  alpha ~ uniform(0.001,1000);
  sigma ~ uniform(0.001,1000);
  
  mu_n ~ uniform(0,1000);
  sigma_n ~ uniform(0,500);
  
  mu_e ~ uniform(0,1000);
  sigma_e ~ uniform(0,1000);
  lambda_e ~ uniform(0,1);
  
  y ~ weibull(alpha, sigma);
  y ~ normal(mu_n, sigma_n);
  y ~ exp_mod_normal(mu_e,sigma_e,lambda_e);
}


generated quantities {
  vector[total] log_lik;
  vector[total] log_lik_norm;
  vector[total] log_lik_weib;
  for (i in 1:total){
    log_lik[i] = exp_mod_normal_lpdf(y[i] | mu_e,sigma_e,lambda_e);
    log_lik_norm[i] = normal_lpdf(y[i] | mu_n,sigma_n);
    log_lik_weib[i] = weibull_lpdf(y[i] | alpha,sigma);
  }
}
