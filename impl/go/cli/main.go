package main

import (
	"fmt"
	"os"

	"github.com/riddler/uxid/v1"
	getopt "github.com/pborman/getopt/v2"
)

func main() {
	// getopt.HelpColumn = 50
	// getopt.DisplayWidth = 140

	fs := getopt.New()
	var (
		prefix = fs.StringLong("prefix", 'p', "", "prefix to use for generated UXID")
		rand_size = fs.IntLong("rand_size", 'r', 10, "number of rand bytes (0-10 inclusive)")
		help = fs.BoolLong("help", 'h', "print this help text")
	)
	if err := fs.Getopt(os.Args, nil); err != nil {
		fmt.Fprintf(os.Stderr, "%v\n", err)
		os.Exit(1)
	}
	if *help {
		fs.PrintUsage(os.Stderr)
		os.Exit(0)
	}

	generate(*prefix, int(*rand_size))
}

func generate(prefix string, rand_size int) {
	id, err := uxid.Generate(prefix, rand_size)
	if err != nil {
		fmt.Fprintf(os.Stderr, "%v\n", err)
		os.Exit(1)
	}

	fmt.Fprintf(os.Stdout, "%s\n", id)
}
