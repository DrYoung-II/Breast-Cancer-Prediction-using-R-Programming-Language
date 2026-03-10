This is a breast cancer prediction project using the K-Nearest Neighbours classification algorithm with the R programming language.

Recently, I worked on a classification task using the Wisconsin Breast Cancer dataset in R, applying K-Nearest Neighbors to predict whether a tumor is benign or malignant.

The stakes were much higher due to the perculiarity of the dataset. 

The interesting part came when choosing K.

A common rule of thumb is:
K = √n

Our dataset had 569 observations, so we started with K = 21.

Here’s what happened:

K = 21 — the “safe” choice that wasn’t safe enough

Overall accuracy: 79%

Benign detection: 100%

Malignant detection: 91.3%

That meant 2 malignant tumors were classified as benign.

In a medical context, that 8.7% miss rate isn’t just a metric problem.
Those represent real patients who could receive the wrong diagnosis.

So we experimented.

We tried a larger K.
It performed worse.

Then we went smaller.

K = 5

Overall accuracy: 97%

Benign detection: 96.1%

Malignant detection: 100%

No malignant tumors were missed.

Dropping K from 21 to 5 didn’t just improve accuracy.
It eliminated false negatives on malignant cases.

And that’s a powerful reminder:

Rules of thumb are a starting point, not a solution.
