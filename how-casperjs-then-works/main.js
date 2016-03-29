var casper = require('casper').create();

casper.on("load.finished", function(){
    this.echo("1 -> 3");
});
casper.on("load.started", function(){
    this.echo("2 -> 2");
});
casper.start('http://example.com/');
casper.echo("3 -> 1");
casper.then(function() {
    this.echo("4 -> 4");
    this.then(function() {
        this.echo("5 -> 6");
        this.then(function() {
            this.echo("6 -> 8");
        });
        this.echo("7 -> 7");
    });
    this.echo("8 -> 5");
});
casper.then(function() {
    this.echo("9 -> 9");
});
casper.run();
