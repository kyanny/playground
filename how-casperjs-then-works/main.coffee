casper = require('casper').create()

casper.start()

casper.open 'http://www.apache.org/'
casper.echo "1 -> #{casper.getTitle()}"

casper.open 'http://www.eclipse.org/', ->
  @echo "2 -> #{@getTitle()}"

casper.open 'http://www.fsf.org/' # same to `casper.thenOpen 'http://www.fsf.org/'`
casper.then ->
  @echo "3 -> #{@getTitle()}"

casper.run()
