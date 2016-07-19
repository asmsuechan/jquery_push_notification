describe('instantiation', function() {

    'use strict';

    it('should create a new Notify instance', function() {
        var notification = window.$.notify("body");
        expect(notification instanceof window.Notification).toBeTruly();
    });
});
