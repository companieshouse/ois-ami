variable "ami_account_ids" {
  type        = list(string)
  description = "A list of account IDs that have access to launch the resulting AMI(s)"
}

variable "ami_name_prefix" {
  type        = string
  default     = "ois-tuxedo-ami"
  description = "The prefix string that will be used for the name tags of the resulting AMI and snapshot(s); the version string will be appended automatically"
}

variable "ansible_host_alias" {
  type        = string
  default     = "tuxedo"
  description = "The Ansible host alias"
}

variable "aws_instance_type" {
  type        = string
  default     = "t3.medium"
  description = "The EC2 instance type used when building the AMI"
}

variable "aws_region" {
  type        = string
  default     = "eu-west-2"
  description = "The AWS region in which the AMI will be built"
}

variable "aws_source_ami_filter_name" {
  type        = string
  default     = "centos7-base-*"
  description = "The source AMI filter string. Any filter described by the DescribeImages API documentation is valid. If multiple images match then the latest will be used"
}

variable "aws_source_ami_owner_id" {
  type        = string
  default     = "169942020521"
  description = "The source AMI owner ID; used in combination with aws_source_ami_filter_name to filter for matching source AMIs"
}

variable "aws_subnet_filter_name" {
  type        = string
  description = "The subnet filter string. Any filter described by the DescribeSubnets API documentation is valid. If multiple subnets match then the one with the most IPv4 addresses free will be used"
}

variable "force_delete_snapshot" {
  type        = bool
  default     = false
  description = "Delete snapshots associated with AMIs, which have been deregistered by force_deregister"
}

variable "force_deregister" {
  type        = bool
  default     = false
  description = "Deregister an existing AMI if one with the same name already exists"
}

variable "kms_key_id" {
  type        = string
  default     = "alias/packer-builders-eu-west-2-kms"
  description = "The KMS key ID or alias to use when encrypting the AMI EBS volumes; defaults to the AWS managed key if empty"
}

variable "playbook_file_path" {
  type        = string
  default     = "../ansible/playbook.yml"
  description = "The relative path to the Ansible playbook file"
}

variable "resource_bucket_name" {
  type        = string
  description = "The name of the S3 resources bucket"
}

variable "resource_bucket_informix_sdk_prefix" {
  type        = string
  default     = "informix"
  description = "The object prefix for Informix Client SDK package within the S3 resources bucket"
}

variable "resource_bucket_c_libraries_prefix" {
  type        = string
  default     = "libraries/c/i686"
  description = "The object prefix for C shared object libraries within the S3 resources bucket"
}

variable "resource_bucket_tuxedo_license_prefix" {
  type        = string
  default     = "licenses/tuxedo"
  description = "The object prefix for Tuxedo license files within the S3 resources bucket"
}

variable "resource_bucket_tuxedo_prefix" {
  type        = string
  default     = "tuxedo"
  description = "The object prefix for Tuxedo packages within the S3 resources bucket"
}

variable "root_volume_iops" {
  type        = number
  default     = 3000
  description = "The baseline IOPS for the root EBS volume; 3000 is the gp3 default"
}

variable "root_volume_size_gb" {
  type        = number
  default     = 20
  description = "The EC2 instance root volume size in Gibibytes (GiB)"
}

variable "root_volume_throughput" {
  type        = number
  default     = 125
  description = "The throughput, in MiB/s, for the root EBS volume; 125 is the gp3 default"
}

variable "ssh_clear_authorized_keys" {
  type        = bool
  default     = true
  description = "Defines whether the authorized_keys file should be cleared, post-build"
}

variable "ssh_private_key_file" {
  type        = string
  default     = "/home/packer/.ssh/packer-builder"
  description = "The path to the common Packer builder private SSH key"
}

variable "swap_volume_iops" {
  type        = number
  default     = 3000
  description = "The baseline IOPS for the swap EBS volume; 3000 is the gp3 default"
}

variable "ssh_username" {
  type        = string
  default     = "centos"
  description = "The username Packer will use when connecting with SSH"
}

variable "swap_volume_device_node" {
  type        = string
  default     = "/dev/xvdb"
  description = "The device node identifier for the swap volume"
}

variable "swap_volume_size_gb" {
  type        = number
  default     = 0
  description = "The EC2 instance swap volume size in Gibibytes (GiB); set to 0 to disable swap volume"
}

variable "swap_volume_throughput" {
  type        = number
  default     = 125
  description = "The throughput, in MiB/s, for the swap EBS volume; 125 is the gp3 default"
}

variable "version" {
  type        = string
  description = "The semantic version number for the AMI; the version string will be appended automatically to the name tags added to the resulting AMI and snapshot(s)"
}
