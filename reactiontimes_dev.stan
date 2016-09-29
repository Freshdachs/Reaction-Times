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
  real<lower=0> q;#quantile we want to observe
}


parameters {
  real<lower=0> alpha;
  real<lower=0> sigma;
  real<lower=0> mu_n;
  real<lower=0> sigma_n;
  real<lower=0> mu_e;
  real<lower=0> sigma_e;
  real<lower=0> lambda_e;
  vector[star_size] y_star;
  real<lower=0, upper=1> quant;
  real<lower=0> dec;
  //vector[total] y;
}

transformed parameters {
  vector[total] dec;
  for ( i in 1:total){
    u <- 
  }
}

model {
  /*for(b in 1:N){
    y[(sum(freqs[1:b])-freqs[b]+1):(sum(freqs[1:b]))] ~ uniform(bins[b]-bin_radius, bins[b]+ bin_radius);
  }*/
  dec ~ bernoulli(q);
  quant ~uniform(0,1)
  
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
