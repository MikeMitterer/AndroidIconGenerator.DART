part of test;

testGUID() {

  group('GUID', () {

    test(' -> generate', () {
      final RegExp reg = new RegExp("^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})");
      
      final String uuid = GUIDGen.generate(); 
      print(uuid);
      
      expect(uuid.length,36);
      expect(reg.hasMatch(uuid),true);
      });

   });

}
