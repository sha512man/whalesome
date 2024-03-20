package main

import (
    "fmt"
    "os"
    "strings"
    "text/template"
)

var vars = make(map[string]*string)

func main() {
  args := os.Args
  tplpath := args[1]

  tmpl, err := template.ParseFiles(tplpath)

  if err != nil {
      fmt.Println("Error parsing template:", err)
      os.Exit(1)
  }

  variables := args[2:]
  varmap := make(map[string]string)

  for _, item := range variables {
      split := strings.Split(item, "=")
      varmap[split[0]] = split[1]
  }

  err = tmpl.Execute(os.Stdout, varmap)

  if err != nil {
    fmt.Println("Error executing template:", err)
    os.Exit(1)
  }
}
