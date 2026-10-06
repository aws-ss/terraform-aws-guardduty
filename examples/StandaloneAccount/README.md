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
