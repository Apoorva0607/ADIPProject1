# ADIPProject1
Statistics in shape space.
A read before trying this project is :http://midag.cs.unc.edu/pubs/papers/CVAMIA04_Fletcher_DTStats.pdf
The main fucntion is input_project1.m. The testing inputs to check this algorithm is corpus collosum data which is saved under cc-shapes folder.Each corpus callosum object consists of 64 points listed in an ASCII text file. Each line of
the file contains a single point (x and y coordinates). The second testing data is set of 100 random traingles corrupted by gaussian noise such that the three points on the traingle is p0=(-1,0), p1=(1,0) and p2=(0,s) where s is a gaussian random varibale with mean =1 and std=0.5 and then its corrupted by a gaussian noise with 0 mean and 0.1 std to all six coordinates of the 100 traingle.

This is an implementation of statistics in shape space like kendall shape space and simple statistics on shape space such as frechet mean etc.
Following functions have been implemented as follows:

1) Preshape fucntion called - pre_shape.m, Project an object onto the preshape sphere by removing its centroid and scaling it to unit
norm. This is a pre-processing step for any shape space analysis in kendall shape space.

2)Performing Ordinary (a.k.a. Orthogonal) Procrustes Analysis (OPA). This should input a target
preshape and moving preshape and output the aligned version of the moving preshape.Using procrustes_user.m it is possible to get rid of rotations from the target image.


3)Computing the exponential map on Kendall shape space, i.e., given a preshape and tangent
vector, compute the preshape at the end of the corresponding geodesic.The function to do that is Exp_map.m

4). Computing the log map on Kendall shape space, i.e., given two preshapes, compute the tangent
vector at the first preshape that is the initial condition of the geodesic segment between the
two. The function to do that is Log_map.m.

5)Estimating the Fr´echet mean shape using gradient descent. Thi is done by meanshape.m.

6)Computing the approximate principal geodesic analysis (PGA), that is, perform principal component
analysis (PCA) in the tangent space to the Fr´echet mean.This is done in fucntion PGA.m



