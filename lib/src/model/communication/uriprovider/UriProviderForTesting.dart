
part of communication;

class _UriProviderForTesting extends UriProvider {

  Uri forHelloDB() => new Uri("http://localhost:8080/api/hellodb");
  Uri forUpload() => new Uri("http://localhost:8080/api/file/upload");
}

