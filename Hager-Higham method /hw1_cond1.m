%{
cond1 function using Hager-Higham method 
to estimate the condition number of matrix A
%}

function [] = hw1_cond1(A)
    [L,U,p] = lu(A,'vector');
    % Calling Hager-Higham estimation function.
    [kappa, z, J] = cond1(L,U,p,A);
    disp('Kappa: ');
    disp(kappa);
    disp('z: ');
    disp(z);
    disp('J: ');
    disp(J);
end

% Function for Initial guess of z value.
function z = initGuess(A)
    [n,~] = size(A);
    z = ones(n, 1); 
    signz = 1; 
    for k = 1: n
        z(k) = signz*(n + k - 1)/n;
        signz = -signz; 
    end 
    z = z/norm(z, Inf);
end

function [kappa, z, J] = cond1(L,U,p,A)
    % Calling initGuess function.
    z = initGuess(A);
    A_Inverse_1Norm = 0;
    [n,~] = size(A);
    
    iter = 0;
    while (iter < 4)
        % Solve for U^T*Y_0 = z and L^T*w_0 = y_0
        y_0 = linsolve(transpose(U),z);
        w_0 = linsolve(transpose(L),y_0);
        
        % Retrieve the index and infinity norm of w_0
        % M: infinity norm, I: index of the max value
        [M,I] = max(abs(w_0));
        
        % Initialize e_j0 with 0 for every element in the matrix
        e_j0 = zeros(n,1);
        % Substitude the e_jo at index I with 1
        e_j0(I,1) = 1;
        
        % Solve for L*v = P^T*e_j0 and U*u_0 = v
        v = linsolve(L,e_j0);
        u_0 = linsolve(U,v);
        % 
        z = sign(u_0);
        
        % Assign the return value.
        iter = iter + 1;
        norm_1 = norm(A,1);
        kappa = M * norm_1;
        J = I;
        
        % End condition.
        if (A_Inverse_1Norm == M)
            break;
        else 
            A_Inverse_1Norm = M;
        end
        
        if (iter == 4)
            disp('Max iter reached');
        end
    end
end

%{
Testing Matricies and
Sample Output:
=======================
matrix1.m: 
-----------------------
cond(A,1)

ans =

  216.5417
-----------------------
hw1_cond1(A)
Kappa: 
  216.5417

z: 
     1
     1
    -1
    -1
     1
     1
    -1
    -1
     1
     1
    -1
     1
     1
    -1
     1

J: 
    15
=======================
matrix2.m:
-----------------------
cond(A,1)
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  2.550909e-17. 
> In cond (line 46) 

ans =

   3.9202e+16
-----------------------
hw1_cond1(A)
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  9.154319e-17. 
> In hw1_cond1>cond1 (line 39)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  7.916007e-17. 
> In hw1_cond1>cond1 (line 53)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  9.154319e-17. 
> In hw1_cond1>cond1 (line 39)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  7.916007e-17. 
> In hw1_cond1>cond1 (line 53)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  9.154319e-17. 
> In hw1_cond1>cond1 (line 39)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  7.916007e-17. 
> In hw1_cond1>cond1 (line 53)
  In hw1_cond1 (line 9) 
Kappa: 
   3.9202e+16

z: 
     1
    -1
     1
    -1
     1
    -1
     1
    -1
     1
    -1
     1
    -1

J: 
    12
=======================
matrix3.m:
-----------------------
cond(A,1)
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  2.014495e-19. 
> In cond (line 46) 

ans =

   4.9640e+18
-----------------------
hw1_cond1(A)
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  2.052636e-17. 
> In hw1_cond1>cond1 (line 39)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  1.261341e-17. 
> In hw1_cond1>cond1 (line 53)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  2.052636e-17. 
> In hw1_cond1>cond1 (line 39)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  1.261341e-17. 
> In hw1_cond1>cond1 (line 53)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  2.052636e-17. 
> In hw1_cond1>cond1 (line 39)
  In hw1_cond1 (line 9) 
Warning: Matrix is close to singular or
badly scaled. Results may be
inaccurate. RCOND =  1.261341e-17. 
> In hw1_cond1>cond1 (line 53)
  In hw1_cond1 (line 9) 
Kappa: 
   4.9640e+18

z: 
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1
    -1

J: 
     1

%}

