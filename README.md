# EventBank gateway

The single HTTP entry point of [EventBank](https://github.com/marcelo-roman/eventbank-platform), built with [YARP](https://github.com/dotnet/yarp). It holds no business logic: it only routes.

| Incoming | Forwarded to |
| --- | --- |
| `/api/accounts/**` | Accounts service, `/accounts/**` |
| `/api/transfers/**`, `/api/pix/**` | Transfers service, `/transfers/**`, `/pix/**` |
| `/api/customers/**` | Customers service, `/customers/**` |
| `/api/cards/**` | Cards service, `/cards/**` |
| `/api/notifications/**` | Notifications service, `/notifications/**` |
| `/api/ops/{accounts,transfers,customers,cards}/**` | That service, `/ops/**` |

The gateway forwards the `Authorization` header untouched; each service validates the Keycloak token itself.

Routes and destinations live in [`appsettings.json`](src/EventBank.Gateway/appsettings.json) and can be overridden with environment variables, for example `ReverseProxy__Clusters__accounts__Destinations__primary__Address=http://accounts:8080`.

```bash
dotnet run --project src/EventBank.Gateway   # http://localhost:5100
```

## License

[MIT](LICENSE)
