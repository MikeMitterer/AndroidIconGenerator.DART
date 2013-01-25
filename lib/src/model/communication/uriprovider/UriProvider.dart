part of communication;

abstract class UriProvider {
  Uri forHelloDB();
  
  UriProvider();
  
  factory UriProvider.forTesting() => new _UriProviderForTesting(); 
}

