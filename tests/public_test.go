package test

import (
	"os"
	"testing"
)

func TestPublicExample(t *testing.T) {
	publicHostedZone := os.Getenv("TF_VAR_public_hosted_zone")

	if publicHostedZone == "" {
		t.Fatal("TF_VAR_public_hosted_zone must be set to run tests. e.g. 'export TF_VAR_public_hosted_zone=example.org'")
	}

	testNamespace(t, "public")
}
