# Standalone Account

Manages a GuardDuty detector and its features.


## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

#### **_NOTE:_**  

* Only one of two features `EKS_RUNTIME_MONITORING` or `RUNTIME_MONITORING` can be added, adding both features will cause an error.
* `additional_configuration` can only be set when name is `EKS_RUNTIME_MONITORING` or `RUNTIME_MONITORING`.
* `AllowDecryptForMalwareScan` is required only if the bucket is encrypted with a customer managed KMS key (SSE-KMS). Uncomment it together with `kms_key_arn` and replace the key ARN.
* Objects outside `object_prefixes` can be scanned on demand. On-demand scans ignore the prefixes configured in the plan:

```bash
$ aws guardduty send-object-malware-scan \
    --s3-object '{"bucket":"amzn-s3-demo-bucket","key":"path/to/object"}'
```
