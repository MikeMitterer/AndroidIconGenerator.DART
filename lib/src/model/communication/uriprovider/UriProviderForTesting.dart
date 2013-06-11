
part of communication;

class _UriProviderForTesting extends UriProvider {

  Uri forHelloDB() => Uri.parse("http://localhost:8080/hellodb/names");
  Uri forUpload() => Uri.parse("http://localhost:8080/api/v1/file/upload");
}

