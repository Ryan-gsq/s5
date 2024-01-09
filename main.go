package main

import (
	"flag"
	"fmt"
	"github.com/armon/go-socks5"
	"log"
)

func main() {
	var port = flag.Int("port", 8278, "Port to listen on")
	flag.Parse()
	server, _ := socks5.New(&socks5.Config{})
	if err := server.ListenAndServe("tcp", fmt.Sprintf("127.0.0.1:%d", *port)); err != nil {
		log.Fatal(err)
	}
}
