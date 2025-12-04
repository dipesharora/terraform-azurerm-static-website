# Demo Steps

1. **Step 1 — Ensure ARM environment variables are set in Terminal**

```bash
export ARM_SUBSCRIPTION_ID=""
export ARM_TENANT_ID=""
export ARM_CLIENT_ID=""
export ARM_CLIENT_SECRET=""
```

2. **Step 2 — Initialize Terraform**

```bash
terraform init
```

3. **Step 3 — Run tests**

```bash
terraform test
```

4. **Step 4 — Add helper module for the "Website is running" test**

- Copy-paste the last `run` block from `website.tftest.hcl.2` into your test config.

5. **Step 5 — Initialize Terraform (again)**

```bash
terraform init
```

6. **Step 6 — Run tests (again)**

```bash
terraform test
```

7. **Step 7 — Simulate a test failure**

- Change the HTTP status code in the assert condition for "Website is running" (e.g., 400, 404, etc.) to force a failure.

8. **Step 8 — Run tests to observe failure**

```bash
terraform test
```

9. **Step 9 — Revert the HTTP status code**

- Change the assert condition for "Website is running" back to `200`.

10. **Step 10 — Commit files to Git**

```bash
git add -A
git commit -m "[demo] Update tests and helper module"
```

11. **Step 11 — Push to remote**

```bash
git push origin main
```

12. **Step 12 — Publish module to TFC Private Module Registry**

- Module Publish Type: `branch`
- Branch Name: `main`
- Module Version: `1.0.0`
- Enable Testing for Module: checked

13. **Step 13 — Configure module tests in TFC**

- Add ARM environment variables to the module test configuration:
  - `ARM_SUBSCRIPTION_ID`
  - `ARM_TENANT_ID`
  - `ARM_CLIENT_ID`
  - `ARM_CLIENT_SECRET`

14. **Step 14 — Update AzureRM provider version in `main.tf`**

- Set the provider to `3.94.0`.

15. **Step 15 — Re-initialize with upgrades**

```bash
terraform init -upgrade
```

16. **Step 16 — Commit provider update and push**

```bash
git commit -a -m "Update AzureRM provider version to 3.94.0"
git push origin main
```

17. **Step 17 — Review module tests in TFC**

- Go to Terraform Cloud and review the Module tests results and logs.

18. **Step 19 — Add mocking test**

- Copy-paste the config from `mocking.tftest.hcl.1` into `website.tftest.hcl`.

19. **Step 20 — Initialize Terraform (after mocking changes)**

```bash
terraform init
```

20. **Step 21 — Run tests (with mocking)**

```bash
terraform test
```

21. **Step 22 — Cleanup**

- Remove the "Website is running" and mocking config from `website.tftest.hcl`.
- Revert the AzureRM provider in `main.tf` to `3.92.0` (if required).
- Delete any lock files.
- Push cleanup changes to Git.
- Delete the module from the TFC Private Registry if desired.


