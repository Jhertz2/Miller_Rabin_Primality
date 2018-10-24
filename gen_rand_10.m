function [x_not, x_k, k, avg_k] = gen_rand_10()
    y = 0;
    for g = 1:10
        rand_10 = 0; % initialize variable
        for i = 0:8
            x = ceil(rand(1,1)*10)*(10^i); %creating a random 10 digit number
            
            if i == 0  % ensuring the 1's place digit is 1, 3, 7, or 9
                
                if x == 0
                    x = 1;
                end
                
                if x == 2
                    x = 3;
                   
                end
                if x == 4
                    x = 7;
                    
                end
                if x == 6
                    x = 7;
                    
                end
                if x == 8
                    x = 9;
                    
                end
            end
        rand_10 = rand_10 + x;
        
            if mod(rand_10, 10) == 0 % ensuring the 1's place digit is 1, 3, 7, or 9
                rand_10 = rand_10 + 1;
            end
    
        end
        
        x_not(g) = rand_10; % saving our x_not
        counter = 0;
    while(1)
        
        ans = Miller_Rabin(sym(rand_10)); % testing for primality
       
        if ans == 1 % if it is a prime, save and move to next iteration
           
            x_k(g) = rand_10;
            
            k(g) = counter;
            break
        end
        
        if ans == 0 % if it is not prime
            counter = counter + 1; % calculate 'k'
            last_digit = mod(rand_10, 10); % determining the value of the 1's place digit
            
            if last_digit == 1 
                y = 2; % from our instructions, to be added to our number
            end
            
            if last_digit == 7
                y = 2; % from our instructions, to be added to our number
            end
            
            if last_digit == 9
                y = 2; % from our instructions, to be added to our number
            end
            
            if last_digit == 3
                y = 4; % from our instructions, to be added to our number
            end
            rand_10 = rand_10 + y; % creating the next number
            
       
        end
        
    end
    
    end
    
    sum = 0;
    for i = 1:10 % for determining the average value of 'k'
        sum = k(i) + sum;
    end
    avg_k = sum / 10;
    
end
        
    
        