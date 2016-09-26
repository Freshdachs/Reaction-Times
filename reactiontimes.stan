// What is provided? reaction times
data {
  // number of frequencies total
  int<lower=0> N;
  //reaction time observations, distr. to some function
  
  //observed frequencies
  int freqs[N];
  //assumes sorted (lo -> hi) & least 2 equidistant bins 
  vector[N] bins;
  real<lower=0> bin_radius;
  // number of Observations total
  int<lower=0> total;
  vector[total] y;
}

transformed data{
  vector [total] inv_y;
  for (i in 1:total){
    inv_y[i] = 1/y[i];
  }
}

parameters {
  real<lower=0> alpha;
  real<lower=0> sigma;
  real<lower=0> mu_n;
  real<lower=0> sigma_n;
  real<lower=0> mu_i;
  real<lower=0> sigma_i;
  //vector[total] y;
}

transformed parameters {
  //real<lower=0> bin_radius;
  //bin_radius = (bins[2]-bins[1])/2;
}

model {
  /*for(b in 1:N){
    y[(sum(freqs[1:b])-freqs[b]+1):(sum(freqs[1:b]))] ~ uniform(bins[b]-bin_radius, bins[b]+ bin_radius);
  }*/
  
  //y ~ uniform(bins[1]-bin_radius,bins[1]+bin_radius);
  alpha ~ uniform(0.001,100);
  sigma ~ uniform(0.001,500);
  mu_n ~ uniform(0,500);
  sigma_n ~ uniform(0,500);
  mu_i ~ uniform(0,1);
  sigma_i ~ uniform(0,1);
  y ~ weibull(alpha, sigma);
  y ~ normal(mu_n, sigma_n);
  inv_y ~normal(mu_i,sigma_i);
}
