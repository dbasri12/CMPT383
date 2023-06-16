
module GCDfunc
    def mygcd(a,b)
        if a % b == 0 
            b
        else
            mygcd(b,a % b)
        end
    end
end

class MyRational
include GCDfunc

    attr_reader :a,:b

    #1 make a rational
    def initialize(a,b)
        raise "b cannot be 0" if b==0
        @a=a
        @b=b 
    end

    def numerator
        @a 
    end

    def denominator
        @b 
    end

    def get_pair
        arr=[@a, @b]
        return arr
    end 

    def to_string
        return @a.to_s + "/" +@b.to_s
    end

    def to_floating
        @a/@b.to_f
    end

    def is_equal(rationals)
        val1=@a/@b.to_f
        val2=rationals.a/rationals.b.to_f
        if val1==val2
            return true
        else 
            return false
        end
    end

    def is_less(rationals)
        val1=@a/@b.to_f
        val2=rationals.a/rationals.b.to_f
        if val1 < val2
            return true
        else
            return false
        end
    end

    def is_integer
        if @a % @b == 0 
            return true
        else
            return false
        end
    end

    def add(rationals)
        new_a=@a * rationals.b + @b*rationals.a
        new_b=@b * rationals.b
        ans=MyRational.new(new_a,new_b)
        return ans
    end

    def multiply(rationals)
        new_a=@a * rationals.a
        new_b=@b * rationals.b
        ans=MyRational.new(new_a,new_b)
        return ans
    end

    def division(rationals)
        new_a=@a * rationals.b
        new_b=@b * rationals.a
        raise "denominator cannot be 0" if new_b==0
        ans=MyRational.new(new_a,new_b)
        return ans
    end

    def invert
        new_a=@b
        new_b=@a
        raise "denominator cannot be 0" if new_b==0
        ans=MyRational.new(new_a,new_b)
        return ans
    end

    def to_lowest
        gcd=mygcd(@a,@b)
        new_a=@a / gcd
        new_b=@b / gcd
        ans=MyRational.new(new_a,new_b)
        return ans
    end

    def harmonic_sum(n)
        ans=MyRational.new(1,1)
        for i in 2..n do 
            r=MyRational.new(1,i)
            ans=ans.add(r)
        end
        return ans
    end

    def <=> (rationals)
        val1=@a/@b.to_f
        val2=rationals.a/rationals.b.to_f
        if val1 > val2 
            return 1
        elsif val1==val2
            return 0 
        elsif val1 < val2 
            return -1
        end
    end
end
