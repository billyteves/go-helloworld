package main

import (
    "fmt"
    "net/http"
)

const (
    port = ":80"
)

func HelloWorld(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w,"-----------------------------------------\n")

}

func main() {

    fmt.Println("Hello World! App")
    fmt.Printf("Started server at http://localhost%v.\n", port)
    http.HandleFunc("/", HelloWorld)
    http.ListenAndServe(port, nil)

}
