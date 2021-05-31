# CSparse (Part of SuiteSparse)

[![Build Status](https://travis-ci.org/JuliaSparse/SuiteSparse.jl.svg?branch=master)](https://travis-ci.org/JuliaSparse/SuiteSparse.jl)

Currently, this package only contains the CSparse functions (`etree`, `symperm`, `ereach` and `csc_permute`) moved from Base Julia.

At some point the rest of the SuiteSparse functionality in Julia might be moved here.

## Documentation


**etree(A[, post])**

   Compute the elimination tree of a symmetric sparse matrix `A` from `triu(A)` and, optionally, its post-ordering permutation.

**symperm(A, p)**

   Return the symmetric permutation of `A`, which is `A[p,p]`. `A` should be symmetric, sparse, and only contain nonzeros in the upper triangular part of the matrix is stored. This algorithm ignores the lower triangular part of the matrix. Only the upper triangular part of the result is returned.
