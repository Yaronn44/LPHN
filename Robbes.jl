function crible(n)
    primes = [nb for nb in range(2,n)]
    for i in primes
        filter!((x -> x % i != 0 || x == i), primes)
    end
    return primes
end