from sklearn.datasets import fetch_openml
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA


mnist = fetch_openml("mnist_784")
scaler = StandardScaler()
scaler.fit(train_set)
train_set = scaler.transform(train_set)
test_set = scaler.transform(test_set)
pca = PCA(.95)
pca.fit(train_set)
train_set = pca.transform(train_set)
test_set = pca.transform(test_set)
