/// Custom Ensemble Business Operation for outputting the longest palindrome results
Class src.Hosts.PalindromeOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

ClassMethod OnRequest(pInput as %FileCharacterStream) as %Status
{
    while 'pInput.AtEnd {
        set str = pInput.ReadLine() 
        for i = 1:1:$length( str, "," ) {
            set word = $piece( str, "," , i ) 
            s LongestPalindrome = GetLongestPalindrome(word)
            s ^Palindromes( str ) = LongestPalindrome
            d ..Adapter.PutLine(LongestPalindrome)
        }
    }
    
    q $$$OK
} 

ClassMethod GetLongestPalindrome(Word As %String = "") As %String
{
	s LongestPalindrome=""

    i ( Word '= ""){

        s LongestPalindrome = $E(Word, 1)

        f i = 1:1:$L(Word) {
            s t = $$expand(Word, i, i)
            i $L(t) > $L(LongestPalindrome) {
                s LongestPalindrome = t
            }
            
            s t = $$expand(Word, i, i + 1)
            i $L(t) > $L(LongestPalindrome) {
                s LongestPalindrome = t
            }
        }
    }

    q LongestPalindrome


expand(Word, begin, end) 
    while((begin >= 1) && (end <= $L(Word)) && ($E(Word, begin) = $E(Word, end))) {
		w $E(Word, begin), $E(Word, end),!
    	s begin = $I(begin, -1)
   		s end = $I(end, 1)
  	}
  	q $E(Word, begin +1, end -1)
}

}
