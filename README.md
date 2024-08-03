# tinygo study

e.g

```
$ cp -p ./src/sample/go.mod ./
$ docker run -it --rm -v ./:/src -w /src -e GOPATH=/ tinygo/tinygo tinygo build -target=pico -o ./build/01_blinky1.uf2 ./src/01_blinky1/main.go
```
