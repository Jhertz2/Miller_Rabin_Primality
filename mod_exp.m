function x = mod_exp(w, A, n)
    x = 1;
    power = mod(w, n);
            
    for i = length(A):-1:1
        if (A(i) == 1)
            x = mod((x * power), n);
        end
                
        power = mod(power*power, n);
      
                
    end
end