Studying Grape's format, default\_format and content\_type
==========================================================

```
$ gem install grape shotgun
$ shotgun
$ rake
```

- If new `content\_type` is registered, `format` and `default\_format` for same content type should be defined, too.
- Since grape parses HTTP POST (key=value) parameters by default, no need to define parser, as long as input is HTTP POST.
- If endpoint can prepare simple-enough CSV string by itself, formatter can be more simpler, like `->(obj, _) { obj }`.
