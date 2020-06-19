def is_prime?(n)
    return false if n < 2
    (2...n).none? {|int| n % int == 0}
end 

def nth_prime(n)
    primes = []
    i=2
    while primes.length < n 
        if is_prime?(i) 
            primes << i
        end 
        i += 1
    end 
    primes[-1]
end 

def prime_range(min, max)
    primes = []
    (min..max).each { |i| primes << i if is_prime?(i) }
    primes
end 