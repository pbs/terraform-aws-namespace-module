package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func testNamespace(t *testing.T, variant string) {
	t.Parallel()

	terraformDir := fmt.Sprintf("../examples/%s", variant)

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDir,
		LockTimeout:  "5m",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	id := terraform.Output(t, terraformOptions, "id")
	arn := terraform.Output(t, terraformOptions, "arn")

	region := getAWSRegion(t)
	accountID := getAWSAccountID(t)

	expectedARN := fmt.Sprintf("arn:aws:servicediscovery:%s:%s:namespace/%s", region, accountID, id)

	assert.Contains(t, id, "ns-")
	assert.Equal(t, expectedARN, arn)
}
