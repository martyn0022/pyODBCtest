package main

import (
	"bytes"
	"fmt"
	"os/exec"
	"strings"
)

func main() {
	// Prepare the Python command
	cmd := exec.Command("python3", "script.py") // Ensure 'python' is the correct command for your environment; it might be 'python3'.

	// Create buffers to capture standard output and standard error
	var stdoutBuf, stderrBuf bytes.Buffer
	cmd.Stdout = &stdoutBuf
	cmd.Stderr = &stderrBuf

	// Execute the Python script
	err := cmd.Run()

	// Capture the standard output and standard error
	stdout := strings.TrimSpace(stdoutBuf.String())
	stderr := strings.TrimSpace(stderrBuf.String())

	// Check if there was an error during the execution
	if err != nil {
		fmt.Println("Error running Python script:", err)
		if stdout != "" {
			fmt.Println("Standard Output:", stdout)
		}
		if stderr != "" {
			fmt.Println("Standard Error:", stderr)
		}
		return
	}

	// If no error, print the standard output
	if stdout != "" {
		fmt.Println("Python script output:", stdout)
	}
}
