require './part1.rb'

def sort_int_str(array)
    arr = array.map do |e| e.dup end
    for i in 1...(arr.length)
        j=i
        while j>0
            if arr[j-1] > arr[j]
                temp=arr[j]
                arr[j]=arr[j-1]
                arr[j-1]=temp
            else
                break
            end
            j=j-1
        end
    end
    return arr
end

def sort_rat(array)
    arr= array.map do |e| e.dup end
    for i in 1...(arr.length)
        j=i 
        while j>0
            if arr[j].is_less(arr[j-1])
                temp=arr[j]
                arr[j]=arr[j-1]
                arr[j-1]=temp 
            else
                break
            end
            j=j-1
        end
    end
    return arr
end

def rand_int(size, max)
    size.times.map{Random.rand(-max..max)}
end

def rand_str(size,str_length)
    size.times.map{[*('A'..'Z'),*('a'..'z'),*('0'..'9')].sample(str_length).join}
end

def rand_rat(size, max)
    size.times.map{MyRational.new(Random.rand(-max..max),Random.rand(-max..-1)||Random.rand(1..max) )}
end
    

for i in 1..10 do 
    lst_int=rand_int(i*1000,10000)
    lst_str=rand_str(i*1000,10)
    lst_rat=rand_rat(i*1000,10000)

    start_int=Time.now
    sorted_int=sort_int_str(lst_int)
    finish_int=Time.now
    diff_int=finish_int-start_int

    start_str=Time.now
    sorted_str=sort_int_str(lst_str)
    finish_str=Time.now
    diff_str=finish_str-start_str

    start_rat=Time.now
    sorted_rat=sort_rat(lst_rat)
    finish_rat=Time.now
    diff_rat=finish_rat-start_rat

    puts "Time in microseconds for n= #{i*1000}"
    puts "numbers = #{diff_int*1000000}, strings=#{diff_str*1000000},rationals=#{diff_rat*1000000}"
end