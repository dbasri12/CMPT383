package main	
import (
	"fmt"
	"math/rand"
	"time"
)

/////PART 2////////////

func generateLstInt(size int)[] int{
	list :=make([]int,size,size)
	for i:= 0;i<size;i++{
		list[i]=rand.Intn(size)-rand.Intn(size)
	}
	return list
}

func insertSortInt(a []int) []int{
	n:=len(a)
	new_list:=make([]int,n,n)
	copy(new_list,a)
	if n<2 {return new_list}
	for i:=1;i<n;i++{
		for j:=i;j>0 && new_list[j-1] > new_list[j];j--{
			new_list[j],new_list[j-1]=new_list[j-1],new_list[j]
		}
	}
	return new_list
}

func RandomString(n int) string{
	var letters = []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
	s := make([]rune, n)
	for i := range s {
		s[i] = letters[rand.Intn(len(letters))]
	}
	return string(s)
}

func generateLstString(size int)[] string{
	list :=make([]string,size,size)
	for i:= 0;i<size;i++{
		list[i]=RandomString(10)
	}
	return list
}

func insertSortString(a []string) []string{
	n:=len(a)
	new_list:=make([]string,n,n)
	copy(new_list,a)
	if n<2 {return new_list}
	for i:=1;i<n;i++{
		for j:=i;j>0 && new_list[j-1] > new_list[j];j--{
			new_list[j],new_list[j-1]=new_list[j-1],new_list[j]
		}
	}
	return new_list
}

func generateLstRational(size int)[] Rationalizer{
	list:=make ([]Rationalizer,size,size)
	for i:= 0;i<size;i++{
		x:=rand.Intn(size)-rand.Intn(size)
		y:=rand.Intn(size)-rand.Intn(size)
		for y==0{
			y=rand.Intn(size)-rand.Intn(size)
		}
		list[i]=Rational{a:x,b:y}
		list[i]=list[i].ToLowestTerms()
	}
	return list
}

func insertSortRational(a []Rationalizer) [] Rationalizer{
	n:=len(a)
	new_list:=make([]Rationalizer,n,n)
	copy(new_list,a)
	if n<2 {return new_list}
	for i:=1;i<n;i++{
		for j:=i;j>0 && new_list[j].LessThan(new_list[j-1]);j--{
			new_list[j],new_list[j-1]=new_list[j-1],new_list[j]
		}
	}
	return new_list
}

func main(){
	rand.Seed(1)
	for i:=1;i<=10;i++{
		rand_int:=generateLstInt(i*1000)
		rand_string:=generateLstString(i*1000)
		rand_rational:=generateLstRational(i*1000)

		startTime_int:=time.Now()
		sorted_int:=insertSortInt(rand_int)
		endTime_int:=time.Since(startTime_int).Microseconds()

		startTime_string:=time.Now()
		sorted_string:=insertSortString(rand_string)
		endTime_string:=time.Since(startTime_string).Microseconds()

		startTime_rational:=time.Now()
		sorted_rational:=insertSortRational(rand_rational)
		endTime_rational:=time.Since(startTime_rational).Microseconds()

		_=sorted_int
		_=sorted_string
		_=sorted_rational

		fmt.Println("Time in ms for n= ",i*1000)
		fmt.Println("integers= %s, strings= %s, rationals= %s",endTime_int,endTime_string,endTime_rational)
	}
}





