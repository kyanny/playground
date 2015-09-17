Dragonfly: 03 Rack
==================

```
$ ./01gen_orig_url.rb
# => http://localhost:9292/W1siZiIsIjIwMTUvMDkvMTgvMzhnd2phY3pzMl9sZW5hX3N0ZC5wbmciXV0
$ rackup
$ open http://localhost:9292/W1siZiIsIjIwMTUvMDkvMTgvMzhnd2phY3pzMl9sZW5hX3N0ZC5wbmciXV0
# => browse PNG image

$ ./02gen_thumb_url.rb
# => http://localhost:9292/W1siZiIsIjIwMTUvMDkvMTgvZTc3Y2J6MnhsX2xlbmFfc3RkLnBuZyJdLFsicCIsInRodW1iIiwiMTI4eDEyOCJdXQ
$ rackup
$ open http://localhost:9292/W1siZiIsIjIwMTUvMDkvMTgvZTc3Y2J6MnhsX2xlbmFfc3RkLnBuZyJdLFsicCIsInRodW1iIiwiMTI4eDEyOCJdXQ
# => browse thumbnail PNG image

$ ./03gen_grayscale_url.rb
# => http://localhost:9292/W1siZiIsIjIwMTUvMDkvMTgvMnd0ZzZxd3l0Ml9sZW5hX3N0ZC5wbmciXSxbInAiLCJjb252ZXJ0IiwiLXR5cGUgR3JheXNjYWxlIl1d
$ rackup
$ open http://localhost:9292/W1siZiIsIjIwMTUvMDkvMTgvMnd0ZzZxd3l0Ml9sZW5hX3N0ZC5wbmciXSxbInAiLCJjb252ZXJ0IiwiLXR5cGUgR3JheXNjYWxlIl1d
# => browse grayscale PNG image
```
