# EventBank gateway

The single HTTP entry point of [EventBank](https://github.com/marcelo-roman/eventbank-platform), built with [YARP](https://github.com/dotnet/yarp). It holds no business logic: it only routes.

| Incoming | Forwarded to |
| --- | --- |
| `/api/accounts/**` | Accounts service, `/accounts/**` |
| `/api/transfers/**` | Transfers service, `/transfers/**` |
| `/api/ops/accounts/**` | Accounts service, `/ops/**` |
| `/api/ops/transfers/**` | Transfers service, `/ops/**` |

Routes and destinations live in [`appsettings.json`](src/EventBank.Gateway/appsettings.json) and can be overridden with environment variables, for example `ReverseProxy__Clusters__accounts__Destinations__primary__Address=http://accounts:8080`.

```bash
dotnet run --project src/EventBank.Gateway   # http://localhost:5100
```

## License

[MIT](LICENSE)
