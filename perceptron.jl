function perceptron(X,y; maxsteps=100, w = rand(size(X,2)))
    # maxsteps: maxmium iteration steps
    # w: initial guess for w
    
    i = 0
    e = 2^2 * size(X,1)
    e_opt = 2^2 * size(X,1)
    w_opt = zeros(size(X,2))
    y_pred = sign(X * w)
    while i < maxsteps       
        if e[1] > 0
            unfound = 1
            while unfound > 0
                j = rand(1:size(X,1))
                if y_pred[j] != y[j]
                    for k = 1 : size(w,1)
                        w[k] += y[j] * X[j,k]
                    end
                    unfound = 0
                end
            end
            y_pred = sign(X * w)
            e = (y_pred - y)'*(y_pred - y)           
            if e[1] < e_opt
                w_opt = deepcopy(w)
                e_opt = e[1]
            end
        else
            break
        end
        i += 1
    end
    return w_opt,i,e_opt
end