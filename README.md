# icon_service
Create a small icon from existing image

### Entry point (development)
  - http://localhost:3000/images.json

Responds to following HTTP methods:

### GET
Returns a list of uploaded icons:
```sh
$ curl -X GET http://localhost:3000/images.json
```

### POST
Creates icon from existing image (url). Accepts JSON object having:
  - **name** - name of the icon to be saved
  - **origin_url** - HTTP link to the original image

```sh
$ curl -X POST -H "Content-Type: application/json" --data '{"name": "Fish", "origin_url": "http://www.openbsd.org/art/puffy/ppuf1000X907.gif"}' http://localhost:3000/images.json
```

### Supported Content Types
  - image/jpeg
  - image/pjpeg
  - image/png
  - image/gif
  - image/bmp
  - image/x-windows-bmp

### Bonus
Web UI available via http://localhost:3000
