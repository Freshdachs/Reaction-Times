// What is provided? reaction times
data {
  // number of frequencies total
  int<lower=0> total;
  // observations
  vector[total] y;
  // size of predictions
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
  //predictions
  vector[star_size] y_star;
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
  y_star ~ exp_mod_normal(mu_e,sigma_e,lambda_e);
}
