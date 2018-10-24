function out = Miller_Rabin( n )
  
    not_done = 0;
    aV = [2 3 5 7 11 13 17 19 23 29 ...
    31 37 41 43 47 53 59 61 67 71 ...
    73 79 83 89 97 101 103 107 109 113 ...
    127 131 137 139 149 151 157 163 167 173 ...
    179 181 191 193 197 199 211 223 227 229 ...
    233 239 241 251 257 263 269 271 277 281 ...
    283 293 307 311 313 317 331 337 347 349 ...
    353 359 367 373 379 383 389 397 401 409 ...
    419 421 431 433 439 443 449 457 461 463 ...
    467 479 487 491 499 ];

    if(n < 500)
    
        out = any(aV == n);
    else
        % Part 1
        N = n-1;
        
        i = 1;
        largest = 0;
        
        while(largest == 0)
            
            test = mod(N, 2^i);
            
            if (test ~= 0) % first time it returns a remainder
                largest = 1;
                r = i-1; % r will be one less than the one that returned a remainder
            end
            i = i+1; % testing 2^i , so increment i
        end
        
        d = N / (2^r); % from our formula
        
        % Part 2: Converting D to a binary representation
        
        i = double(ceil(log2(d))); % to create the max size of the array (neccessary binary digits)
        
        A = zeros(1, i);
        z = 1; % to increment our array
        temp = d; % to be used for a boolean comparison
        while (z ~= (length(A) + 1) )
            
            
            i = i-1;
            
            
            if (temp-2^i < 0) % if the number is too large, we don't include its binary value
                A(z) = 0; % set binary place to a 0
                
            end
            if(temp-2^i >= 0) % if number is not too large, we do include its binary value
                A(z) = 1; % set binary place to a 1
                temp = temp - 2^i; % move on to the next lowest value
            end
            z = z +1;
        end
       
        % Part 3: W Loop
        
        
        done = 0;
        
       
        
        for u = 1:length(aV)
           
            w = aV(u);
            
            
            if done == 1
                break
            end
                
            x = mod_exp(w, A,  n); %mod exponentiation
            
            
            
            if (x == 1 || x == (n-1))
                
                continue
                    
            end
                
            for g = 1:(r-1)
 
                
                x = mod(x*x, n);
                
                if (x == 1)
                    out = 0;
                    return
                    
                    
                end
                
                if x == (n-1)
                   not_done = 1;
                    break;
                    
                end
                
                
            end
            
            if not_done == 0
                out = 0;
                return
            end
            
          
        end
        
        out = 1;
        return
       
        
    end
         
       
       
end