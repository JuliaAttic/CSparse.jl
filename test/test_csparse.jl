
# elimination tree
## upper triangle of the pattern test matrix from Figure 4.2 of
## "Direct Methods for Sparse Linear Systems" by Tim Davis, SIAM, 2006
rowval = Int32[1,2,2,3,4,5,1,4,6,1,7,2,5,8,6,9,3,4,6,8,10,3,5,7,8,10,11]
colval = Int32[1,2,3,3,4,5,6,6,6,7,7,8,8,8,9,9,10,10,10,10,10,11,11,11,11,11,11]
A = sparse(rowval, colval, ones(length(rowval)))
p = SuiteSparse.etree(A)
P,post = SuiteSparse.etree(A, true)
@test P == p
@test P == Int32[6,3,8,6,8,7,9,10,10,11,0]
@test post == Int32[2,3,5,8,1,4,6,7,9,10,11]
@test isperm(post)

# csc_permute
A = sprand(10,10,0.2)
p = randperm(10)
q = randperm(10)
@test SuiteSparse.csc_permute(A, invperm(p), q) == full(A)[p, q]

# symperm
srand(1234321)
A = triu(sprand(10,10,0.2))       # symperm operates on upper triangle
perm = [10,6,1,9,5,3,7,8,4,2]
@test SuiteSparse.symperm(A,perm).colptr == [1,1,2,4,5,5,6,8,8,9,10]