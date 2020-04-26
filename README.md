# drawio-local

Deploy [draw.io](https://github.com/jgraph/drawio) with local feature only.

Demo: <https://test2go.github.io/drawio-local/>

Disable features:

- [x] All online storages, e.g. google drive, Drawio Drive, OneDrive etc.
- [x] Remove logo click to draw io official website
- [x] Disable draw io desktop client download notification.
- [ ] Help and support info to draw io.
- [ ] Sharing links and export links to draw io.

## Why this project

You may want to deploy [draw.io](https://github.com/jgraph/drawio) in your company without any external features, download the repo and host to nginx or using python simple server:

```bash
cd drawio-local
python3 -m http.server 8000
```

To avoid unexpected errors or problems, please serve the web as root path:

- `http://draw.example.com:8000/` (Recommended)
- `http://www.example.com:8080/draw` (Not Recommended)

## Deploy with docker

I have already built a docker image for this repo.

```bash
# local-port:docker-port
docker run --name="drawio-local" --restart=always -p 5000:5000  tobyqin/drawio-local
```

If you want to build such image inside company, checkout the `Dockerfile`.

## How does it work

You can build the local draw io by yourself, steps like this:

1. Download latest version of [drawio](https://github.com/jgraph/drawio)
2. Just keep the `src/main/webapp` folder
3. Modify [PreConfig](https://github.com/jgraph/drawio/blob/master/src/main/webapp/js/PreConfig.js) with [supported parameters](https://desk.draw.io/support/solutions/articles/16000042546-what-url-parameters-are-supported-).
4. To total disable `external connections`, please set `offline='1'` and `local='1'`

However, when set`offline='1'` will disable template feature and still show "Download Drawio Desktop" notification. So I modified `js/app.min.js` a little to disable the notification, check my commit history to learn the some other hacks.

## License

diagrams.net is licensed under the Apache v2.

## Supported Browsers

diagrams.net supports IE 11, Chrome 32+, Firefox 38+, Safari 9.1.x, 10.1.x and 11.0.x, Opera 20+, Native Android browser 5.1.x+, the default browser in the current and previous major iOS versions (e.g. 11.2.x and 10.3.x) and Edge 23+.
