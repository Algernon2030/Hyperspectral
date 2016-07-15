[X Y] = meshgrid(-5:0.05:5, -5:0.05:5);
randn('seed',0);
train_X = [-2+randn(200,2)' 2+0.5*randn(200,2)']';
test_X = [X(:) Y(:)];
train_N = size(train_X,1);
tic
[a b]=kde(train_X, test_X);
toc

w = 1/train_N*ones(1,train_N);
Mu = train_X;
Sigma = diag(b.^2);
Sigma = repmat(Sigma,[1 1 train_N]);
a1 = calc_log_gmm(test_X, w, Mu, Sigma);


mesh(X,Y,reshape(exp(a),201,201))
sum(exp(a))*0.0025



randn('seed', 0)
X = 5 + randn(300,1);
tic
[logp s] = kde(X,X);
toc

T_1 = [ 1.25171606198816  -1.81110620114180
  -0.33221435763109   1.51323666035284
  -0.53760498826565   0.29051756447874
  -0.07682553354898  -1.04983371739413
   3.02991421150621   1.84562725820739
   0.09568039768573   0.17480727785518
  -0.31703152761217  -1.85328053540385
  -1.52515303765836  -0.80050863052152
   2.69775799970425   1.52791942898650
   1.36539812247780   1.20835919187104
  -1.18182140213029  -2.39617762625007
   0.04909439310418  -0.77438345249648
  -1.30212812835905  -0.87434005985756
   1.86319209841924  -1.29434677978837
   1.20186484260508  -0.01955158544816
   0.79064528186815   2.13251372390587
   1.40269486919211   0.72299683997946
  -0.53312445194538  -2.44922073651041
  -0.78427601188991  -1.72361814948807
  -0.78975438110635   1.48124484597132
  -1.83409528277357  -0.35537251983832
   0.15974431192621  -0.62708121778875
   1.74248592177819  -1.53442024200372
  -0.72567411204184   2.25586863543682
   0.67448968363176   1.49315704503719
  -0.23708401116460   1.33012331884439
   0.26772119764116   1.80019965046484
   1.18373967588920   1.18365547857607
  -1.53187928297105   0.06857000332741
  -0.21743494806857  -0.65377374493300 ];

kde(T_1, T_1)
