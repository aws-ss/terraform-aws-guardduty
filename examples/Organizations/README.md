# Organizations

Manages GuardDuty for an AWS Organization. Apply from the Organizations management account, which becomes the delegated GuardDuty administrator.


## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

#### **_NOTE:_**  

* The `GUARDDUTY_POLICY` policy type must be disabled on the Organizations root. While it is enabled, setting `auto_enable_organization_members` to `ALL` or `NEW` fails with `BadRequestException: The request is rejected because an invalid or out-of-range value is specified as an input parameter.` The GuardDuty console may enable this policy type during organization setup. Check with `aws organizations list-roots --query 'Roots[].PolicyTypes'` and disable with `aws organizations disable-policy-type --root-id <root-id> --policy-type GUARDDUTY_POLICY`.
* `AllowDecryptForMalwareScan` is required only if the bucket is encrypted with a customer managed KMS key (SSE-KMS). Uncomment it together with `kms_key_arn` and replace the key ARN.
* Objects outside `object_prefixes` can be scanned on demand. On-demand scans ignore the prefixes configured in the plan:

```bash
$ aws guardduty send-object-malware-scan \
    --s3-object '{"bucket":"amzn-s3-demo-bucket","key":"path/to/object"}'
```
