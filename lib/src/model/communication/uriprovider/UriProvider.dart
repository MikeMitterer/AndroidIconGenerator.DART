part of communication;

abstract class UriProvider {
  Uri forHelloDB();
  Uri forUpload();

  UriProvider();

  factory UriProvider.forTesting() => new _UriProviderForTesting();
}

