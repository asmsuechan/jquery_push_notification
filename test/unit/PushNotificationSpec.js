describe('instantiation', function() {

    'use strict';

    it('should create a new Notify instance', function() {
        var notification = window.$.notify("body");
        expect(notification).toBeDefined();
    });

    it('should throw an exception', function(){
      expect(function(){ window.$.notify() }).toThrow();
    });

    it('should throw an exception', function(){
      expect(function(){ window.$.notify(1) }).toThrow();
    });
});
