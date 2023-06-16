package main	
import (
	"fmt"
	"errors"
	"strconv"
)

type Floater64 interface {
    // Converts a value to an equivalent float64.
    toFloat64() float64
}

type Rationalizer interface {

    // 5. Rationalizers implement the standard Stringer interface.
    fmt.Stringer

    // 6. Rationalizers implement the Floater64 interface.
    Floater64

    // 2. Returns the numerator.
    Numerator() int

    // 3. Returns the denominator.
    Denominator() int

    // 4. Returns the numerator, denominator.
    Split() (int, int)

    // 7. Returns true iff this value equals other.
    Equal(other Rationalizer) bool

    // 8. Returns true iff this value is less than other.
    LessThan(other Rationalizer) bool

    // 9. Returns true iff the value equal an integer.
    IsInt() bool

    // 10. Returns the sum of this value with other.
    Add(other Rationalizer) Rationalizer

    // 11. Returns the product of this value with other.
    Multiply(other Rationalizer) Rationalizer

    // 12. Returns the quotient of this value with other. The error is nil 
    // if its is successful, and a non-nil if it cannot be divided.
    Divide(other Rationalizer) (Rationalizer, error)

    // 13. Returns the reciprocal. The error is nil if it is successful, 
    // and non-nil if it cannot be inverted.
    Invert() (Rationalizer, error)

    // 14. Returns an equal value in lowest terms.
    ToLowestTerms() Rationalizer
} // Rationalizer interface

type Rational struct {
	a , b int
}

func (r Rational) String() string{ 
	return strconv.Itoa(r.a) + "/" + strconv.Itoa(r.b)
}

func (r Rational) toFloat64() float64{
	return float64(r.a)/float64(r.b)
}

func (r Rational) Numerator() int{
	return r.a
}

func (r Rational) Denominator() int{
	return r.b
}

func (r Rational) Split() (int,int){
	return r.a,r.b
}

func (r Rational) Equal(other Rationalizer) bool{
	x :=float64(r.a)/float64(r.b)
	if x == other.toFloat64() {
		return true
	}
	return false 
}

func (r Rational) LessThan(other Rationalizer) bool{
	x :=float64(r.a)/float64(r.b)
	if x < other.toFloat64() {
		return true
	}
	return false 
}

func (r Rational) IsInt() bool{
	if r.a % r.b == 0 {
		return true
	}
	return false
}

func (r Rational) Multiply(other Rationalizer) Rationalizer{
	x:=r.a*other.Numerator()
	y:=r.b*other.Denominator()
	var ans Rationalizer
	ans=Rational{a:x,b:y}
	return ans
}

func (r Rational) Add(other Rationalizer) Rationalizer{
	x:=r.a*other.Denominator()
	y:=r.b*other.Numerator()
	z:=r.b* other.Denominator()
	var ans Rationalizer
	ans=Rational{a:x+y,b:z}
	return ans
}

func (r Rational) Divide(other Rationalizer) (Rationalizer,error){
	x:=r.a*other.Denominator()
	y:=r.b*other.Numerator()
	var ans Rationalizer
	if other.Numerator()==0{
		return ans,errors.New("Can't divide by 0")
	}
	
	ans=Rational{a:x,b:y}
	return ans,nil
}

func (r Rational) Invert() (Rationalizer,error){
	var ans Rationalizer
	if r.a==0 {
		return ans,errors.New("Can't divide by 0")
	}
	ans=Rational{a:r.b,b:r.a}
	return ans,nil
}

func (r Rational) ToLowestTerms() Rationalizer{
	var num,dem int
	num=r.a
	dem=r.b
	for dem != 0 {
		t:=dem
		dem=num%dem
		num=t
	}
	var ans Rationalizer
	if num==-1{
		ans=Rational{a:r.a/num,b:r.b/num}
		return ans
	}
	ans=Rational{a:r.a/num,b:r.b/num}
	return ans
}

func HarmonicSum(n int) Rationalizer{
	var ans Rationalizer
	ans=Rational{a:1,b:1}
	for i := (2); i<=(n);i++{
		var r Rationalizer
		r=Rational{a:1,b:i}
		ans=ans.Add(r)
	}
	return ans
}

func MakeRational(a int, b int) (Rationalizer,error){
	var ans Rationalizer
	if b==0{
		return ans,errors.New("Can't divide by 0")
	}
	ans=Rational{a:a,b:b}
	return ans,nil
}
