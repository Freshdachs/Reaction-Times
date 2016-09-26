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
  int<lower=0> total = sum(freqs);
  
  real<lower=0> bin_radius = (bins[1]-bins[0])/2;
  for(b in 1:n_bins){
    y[i]
    (y-bin[b])*2/bin_width
    freqs[i] = sum()
  }
  
}

model {
  for(b in 1:n_bins){
    y[(sum(freqs[1:b])-freqs[b]):(sum(freqs[1:b])]~uniform(bins[b])
  }
  y ~ weibull(alpha, sigma);
}
