%% FEA MATLAB Project 1 - Global Stiffness Matrix Function
% Project by: Mauricio Cabrera, Marc Rozman
% Date: 09/18/2017

function [MTXK] = gsm_(VecK)
% Input is an array of stiffness constants for each spring element going left to right
% Output is a global stiffness matrix for the element assembly

n = length(VecK)+1;     % n is the number of nodes
MTXK = zeros(n,n);      % creates a square matrix of zeros, with side size n, number of nodes

for i = 1:n-1
    MTXK(i,i) = MTXK(i,i) + VecK(i);
    MTXK(i, i+1) = MTXK(i, i+1) - VecK(i);
    MTXK(i+1, i) = MTXK(i+1, i) - VecK(i);
    MTXK(i+1, i+1) = MTXK(i+1, i+1) + VecK(i);
end
% loops sequentially through the matrix. Because of the symmetrical nature
% of the global stiffness matrix, the above indexing logic (using the loop
% controller variable i) can be executed.

end












