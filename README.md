# riverpod_clean

Riverpod minimum boilerplate app

Features:
- [x] type-safe routing
- [x] organized theming
- [x] internet checking
- [x] authentication
- [x] local storage
- [x] logging
- [ ] error handling
- [ ] 100% coverage

Since code generation is heavily used, remember to run
`dart run build_runner watch -d`
when dealing with freezed, auto_route and riverpod

to use Sentry, set `dart-define` variable `SENTRY_DNS`

{
    "name": "Debug run",
    "request": "launch",
    "type": "dart",
    "args": [
        "--dart-define",
        "SENTRY_DNS=<YOUR_DNS>",
    ],
},