part of test;

testREST(final UriProvider uriprovider) {

  group('Communication + JSON', () {

    test(' -> Test UriProvider', () {
      final String url = "http://localhost:8080/api/hellodb";
      expect(uriprovider.forHelloDB().toString(),url);
      expect(uriprovider.forHelloDB().path,"/api/hellodb");
    });

    test(' -> Test READ from REST-Server', () {
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
      //req.on.loadEnd.add(expectAsync1((l) => loadEnd(req)));
      
      // Neu
      //req.onLoadEnd.listen((ProgressEvent e) => loadEnd(req));
      req.onLoadEnd.listen(expectAsync1((ProgressEvent e) => loadEnd(req)));
      
      req.send();

    });
    
    test(' -> Upload File to REST-Server', () {
      final HttpRequest req = new HttpRequest();

      loadEnd(HttpRequest request) {
        if (request.readyState == HttpRequest.DONE) {

          switch(request.status) {

            case HttpStatus.HTTP_200_OK:
              // Mehr Infos: http://www.dartlang.org/articles/json-web-service/#parsing-json
              final Map response = parse(request.responseText);
              print("Text: ${request.responseText}, Status: ${request.status}");
              print(response);

              print(response['path']);
              expect(response['path'].endsWith("android.png"),true);
              
              final UploadResponseTO ur = new UploadResponseTO.fromJson(request.responseText);
              expect(ur.path.endsWith("android.png"),true);
              
              print(ur.toJson());
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

      req.open("POST", uriprovider.forUpload().toString());
      
      //req.setRequestHeader('Content-type', 'application/json');
      req.setRequestHeader('Accept', 'application/json');

      req.onLoadEnd.listen(expectAsync1((ProgressEvent e) => loadEnd(req)));
      
      final FormData formData = new FormData();
      final String base64Image = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAQAAAAC0hrNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAJiS0dEAACqjSMyAAAC1ElEQVRYw+2XzUtUURTAf+N8R4hFVqRkaJYRLgQrMKisdrVQEAQLI6JNSH+A4K59mwp3UajQwoyslJZRgUJRRANCLaIvB9R0THnNm3m3xVzfvBnHO3feDBE458LjvHvvO7937jv3nHdhs0sF12hUzmigD6+eqfxiMU27YqaH00yT1MFpvROzHMHiJ+BhKzuoZhthBCYALexjHKFjyKeFs5igkxhHOcFhdhECDKJEeMEUJ3ms55u+1POQr5iIrGbyjUc0lBLlp5uPWOtQ6RahB39pYCH6iSlQqbbMAOHiYT76MeSy5fbPkktsMKAZCQrpYgmB4Dkd3M+JG6aDSQSCGN3FwWp5K41eAU6xsg62yhmgV3r+jr1qg+p9d5VL9heM0UPruhl+vCS4LLPObqK8cutbFa8zQn6jbxd33E2x3S3uGIt5IzK7LdGmMqnKmU1UFvyKlTSphlWhW41VcHLysVM17FGM1dOol3gz7H3mk653Xo5zHoNR3gOCJRe41BPNdBHmKS9V63OBWQSCGVqBmxj8LrAZDAItRBAIovZGyikRO8IGgdsFx6VAcBe4Zd/NZAIyI/OArR1ynXAFIUd07lfh0jnGr/VbsdH3Sz+bZcW9UVdSxpVxZdymxYmCS48L3KKtzRN3adGD6bCzrMKNSZ9MxkkoK71KEozLlxWMZQ5lVvMBDM4RZ4iRotbsAbX0EmCCG+qJAeqokYXojuvyCl5qqCOQbT77TyzOl6L8WpMk33N1qzaC4Qq0ohpU4SaYKxi2wBPVsCr6KujkIluwqKLVXvYffJBaM3ukluQNC1RgMMxoMed0P0G8tMlTnkAwRJAAAYIM2X0rtOMlmP/AnO+8aTquKbH4Y2trIkiQ1PHqP8mZZdw/wYkcGrrlSg8Xc+SKX7aWTgKrjpJTAglyT+6wec7ave3Myd4RQqXEQSPPMIly3bFTffQxS4JJDpYWVhYt+Qt2HYjtRlsGfAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxMy0wMS0wNVQxNjo0NToyOSswMTowMOqhDGcAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTMtMDEtMDVUMTY6NDU6MjkrMDE6MDCb/LTbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAABJRU5ErkJggg==";
      final String raw = "iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAQAAAAC0hrNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAJiS0dEAACqjSMyAAAC1ElEQVRYw+2XzUtUURTAf+N8R4hFVqRkaJYRLgQrMKisdrVQEAQLI6JNSH+A4K59mwp3UajQwoyslJZRgUJRRANCLaIvB9R0THnNm3m3xVzfvBnHO3feDBE458LjvHvvO7937jv3nHdhs0sF12hUzmigD6+eqfxiMU27YqaH00yT1MFpvROzHMHiJ+BhKzuoZhthBCYALexjHKFjyKeFs5igkxhHOcFhdhECDKJEeMEUJ3ms55u+1POQr5iIrGbyjUc0lBLlp5uPWOtQ6RahB39pYCH6iSlQqbbMAOHiYT76MeSy5fbPkktsMKAZCQrpYgmB4Dkd3M+JG6aDSQSCGN3FwWp5K41eAU6xsg62yhmgV3r+jr1qg+p9d5VL9heM0UPruhl+vCS4LLPObqK8cutbFa8zQn6jbxd33E2x3S3uGIt5IzK7LdGmMqnKmU1UFvyKlTSphlWhW41VcHLysVM17FGM1dOol3gz7H3mk653Xo5zHoNR3gOCJRe41BPNdBHmKS9V63OBWQSCGVqBmxj8LrAZDAItRBAIovZGyikRO8IGgdsFx6VAcBe4Zd/NZAIyI/OArR1ynXAFIUd07lfh0jnGr/VbsdH3Sz+bZcW9UVdSxpVxZdymxYmCS48L3KKtzRN3adGD6bCzrMKNSZ9MxkkoK71KEozLlxWMZQ5lVvMBDM4RZ4iRotbsAbX0EmCCG+qJAeqokYXojuvyCl5qqCOQbT77TyzOl6L8WpMk33N1qzaC4Qq0ohpU4SaYKxi2wBPVsCr6KujkIluwqKLVXvYffJBaM3ukluQNC1RgMMxoMed0P0G8tMlTnkAwRJAAAYIM2X0rtOMlmP/AnO+8aTquKbH4Y2trIkiQ1PHqP8mZZdw/wYkcGrrlSg8Xc+SKX7aWTgKrjpJTAglyT+6wec7ave3Myd4RQqXEQSPPMIly3bFTffQxS4JJDpYWVhYt+Qt2HYjtRlsGfAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxMy0wMS0wNVQxNjo0NToyOSswMTowMOqhDGcAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTMtMDEtMDVUMTY6NDU6MjkrMDE6MDCb/LTbAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAABJRU5ErkJggg==";
      final String contenttype = "image/png";
      
      final List<int> intList = Base64.decode(raw);
      final Int8Array int8array = new Int8Array.fromList(intList);
      var binary = window.atob(base64Image.split(',')[1]);
      
      final Uint8Array uint8array = new Uint8Array(intList.length);
      for(var i = 0;i< intList.length;i++) {
        uint8array[i] = intList[i];
      }
      // final String atobString = window.atob(base64Image);
      
      final Blob blob = new Blob([uint8array]);
        //final Blob blob  = new Blob([uint8array], contenttype);
        
//      final FileReader filereader = new FileReader();
//      filereader.onLoadEnd.listen((ProgressEvent event) {
//        var res = filereader.result;
//        print(res);
        
//        formData.append('file', res, "android.png");
//        req.send(formData);
//      });
//      filereader.readAsText(blob);
      
      formData.append('file', blob, "android.png");
      ////formData.append('new-filename', "icon-share.png");

      req.send(formData);

      
    });
    
    
  });
}