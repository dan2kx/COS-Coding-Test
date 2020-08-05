/// Custom Ensemble Business Service for reading the input for the Longest Palindrome problem
Class src.Hosts.PalindromeService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Parameter SETTINGS = "TargetConfig";

Property TargetConfig as %String (MAXLEN = 100);

Method OnProcessInput(pInput As %FileCharacterStream, pOutput As %FileCharacterStream) As %Status
{
   q ..SendRequestAync(..TargetConfig, pInput)
}

}
