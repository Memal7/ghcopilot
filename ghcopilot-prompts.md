# Exercises: GitHub Copilot with Terraform

<details>
<summary>Challenge #1 - Refining your Terraform file with Copilot assistance</summary>

### Refining your Terraform file with Copilot assistance

Try to improve the code suggested by Copilot by yourself. For example, try to change the following:
- Create a simple and small Azure VM based on Linux Ubuntu:20.04 in my main.tf file.
- Change the size of the VM to the next bigger one.
- Change the network interface of Azure VM to another one.
- Change the deployment region from sweden central to US East.

</details>

<details>
<summary>Challenge #2 - Document your terraform file</summary>

### Document your terraform file

Try writing documentation for this Terraform script; GitHub Copilot will make suggestions for natural language documentation as well.

</details>


<details>
<summary>Challenge #3 - Verify your Terraform file using tfsec</summary>

### Verify your Terraform file using tfsec

- `tfsec` is an open source static analysis security scanner for your Terraform code. Use `tfsec` to verify that the terraform file you've just completed to detect any issues.
>:bulb: tfsec is preinstalled in the Codespaces environment. If you are not using the Codespaces environment, you will need to visit https://aquasecurity.github.io/tfsec/v1.28.1/ to install the tool locally.
- In VSCode, in the **terminal** panel, enter `tfsec` to run the tool against the terraform file. Depending on any changes you've made, there will likely be a number of issues identified. It's important to realise that GitHub Copilot's output (or any generated output for that matter) should always be reviewed and verified. Your existing processes should be followed to ensure that any changes are reviewed and approved before being merged into your main branch.
</details>