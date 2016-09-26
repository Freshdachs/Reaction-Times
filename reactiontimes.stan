// What is provided? reaction times
data {
  // number of Observations total
  int<lower=0> N;
  //reaction time observations, distr. to some function
  
  //observed frequencies
  vector[N] freqs;
  //assumes sorted (lo -> hi) & least 2 equidistant bins 
  vector[N] bins;
}

parameters {
  real<lower=0> alpha;
  real<lower=0> sigma;
  vector[total]<lower=0> y;
}

transformed parameters {
  //number of total participants
  int<lower=0> total = sum(freqs)
  
  real<lower=0> bin_width = bins[1]-bins[0]
  for(b in 1:n_bins){
    (y-bin[b])*2/bin_width
    freqs[i] = sum()
  }
  
}

model {
  
  y ~ weibull(alpha, sigma);
}
