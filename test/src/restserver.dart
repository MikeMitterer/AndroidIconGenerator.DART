part of test;

testREST(final UriProvider uriprovider) {

  group('Read Names from DB', () {

    test('Test UriProvider', () {
      final String url = "http://localhost:8080/api/hellodb";
      expect(uriprovider.forHelloDB().toString(),url); 
      expect(uriprovider.forHelloDB().path,"/api/hellodb");
    });
    
    test('Test READ', () {
      final HttpRequest req = new HttpRequest();

      loadEnd(HttpRequest request) {
        if (request.readyState == HttpRequest.DONE) {

          switch(request.status) {

            case HttpStatus.HTTP_200_OK:
              // Mehr Infos: http://www.dartlang.org/articles/json-web-service/#parsing-json
              final List response = parse(request.responseText);
              print("Text: ${request.responseText}, Status: ${request.status}");
              print(response[0]);
              expect(response[0]["firstname"],"Mike");
              
              final NameTO name = new NameTO.fromJson(response[0]);
              expect(name,isNotNull);
              print(name.firstname);
              
              expect(name.toJson(),stringify(response[0]));
              print(name.toJson());
              
              break;

            case HttpStatus.HTTP_0_COMMUNICATION_FAILED:
              expect(request.status,HttpStatus.HTTP_200_OK);
              break;

            default:
              expect(request.status,HttpStatus.HTTP_200_OK);
              break;
          }
        }
      }

      req.open("GET", uriprovider.forHelloDB().toString());
      req.setRequestHeader('Content-type', 'application/json');
      req.setRequestHeader('Accept', 'application/json');

      // funkt (normal)
      //req.on.loadEnd.add((listener) => loadEnd(req));

      // funkt (test)
      //req.on.loadEnd.add(expectAsync1((l) {
      //  expect(1, equals(0));
      //}));

      // Mehr Infos: http://www.dartlang.org/articles/dart-unit-tests/#asynchronous-tests
      req.on.loadEnd.add(expectAsync1((l) => loadEnd(req)));

      req.send();

    });
  });
}