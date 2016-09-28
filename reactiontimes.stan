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
}


parameters {
  real<lower=0> alpha;
  real<lower=0> sigma;
  real<lower=0> mu_n;
  real<lower=0> sigma_n;
  real<lower=0> mu_e;
  real<lower=0> sigma_e;
  real<lower=0> lambda_e;
  #vector[total] y_dev;
  //vector[total] y;
}

transformed parameters {
  //real<lower=0> bin_radius;
  //bin_radius = (bins[2]-bins[1])/2;
  #vector[total] y_star;
  #y_star = y + y_dev;
}

model {
  /*for(b in 1:N){
    y[(sum(freqs[1:b])-freqs[b]+1):(sum(freqs[1:b]))] ~ uniform(bins[b]-bin_radius, bins[b]+ bin_radius);
  }*/
  
  alpha ~ uniform(0.001,100);
  sigma ~ uniform(0.001,500);
  
  mu_n ~ uniform(100,500);
  sigma_n ~ uniform(1,500);
  
  mu_e ~ uniform(0,500);
  sigma_e ~ uniform(0,500);
  lambda_e ~ uniform(0,200);
  
  //y_dev ~ uniform(-bin_radius, bin_radius);
  y ~ weibull(alpha, sigma);
  y ~ normal(mu_n, sigma_n);
  y ~ exp_mod_normal(mu_e,sigma_e,lambda_e);
}
