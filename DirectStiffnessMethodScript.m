%% DISPLACEMENT FUNCTION SOLVER - FEA
% Project by: Mauricio Cabrera, Marc Rozman
% Date: 09/18/2017

% This code uses the Direct Stiffness Method to solve problem 2.1 in the
% textbook.

% A First Course in the Finite Element Method - Problem 2.1:
% a. Obtain the global stiffness matrix K of the assemblage of spring
% elements shown by superimposing the stiffness matrices of the individual 
% springs. Here k1; k2, and k3 are the stiffnesses of the springs as shown.
% b. If nodes 1 and 2 are fixed and a force P acts on node 4 in the
% positive x direction, find an expression for the displacements of nodes 3
% and 4.
% c. Determine the reaction forces at nodes 1 and 2.


clc; format short g;

k = [1000 2000 3000] %stiffness of 1-dimensional spring elements

n = length(k)+1; %number of nodes

VecU = zeros(n,1);  %Global displacement vector
VecF = zeros(n,1);  %Global force vector
VecF = VecF + 1;    % Helps find unknown forces later on

%Boundary Conditions
VecU(1) = 0;
VecU(4) = 0;
VecF(2) = 0;
VecF(3) = 5000;

% Calls function and creates the global stiffness matrix
% Solves part a)
MTX = gsm_(k) 

% Marks and removes the unknown forces to distill a smaller K matrix 
% with which to solve the displacements.
ToKeep = (VecF ~= 1); 
NewF = VecF(ToKeep);
NewMTX = MTX([ToKeep],[ToKeep]);


% Finds the displacements and stores them in NewU
% Solves part b)
NewU = NewMTX\NewF;

% Updates the original vector of node displacements with the information 
% in NewU
VecU(ToKeep) = NewU

% Solves for unknown Force values
% Solves part c)
VecF = MTX*VecU
% The reaction forces are VecF(1) and VecF(4) for the nodes 1 and 4,
% respectively.