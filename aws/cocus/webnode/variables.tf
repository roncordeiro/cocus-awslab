variable "environment" {
  type        = string
  description = "environment"
}

variable "project" {
  type        = string
  description = "Name of project"
}
variable "vpc_id" {
  type        = string
  description = "Vpc"
}

variable "public_subnet_ids" {
  description = "Ids of subnets where to create node-instances"
  type        = list
}

variable "os" {
  description = "The OS reference to search for"
  default = "amazon-2_lts"
}

variable "architecture" {
  description = "The OS Architecture"
  type        = string
  default     = "x86_64"
}
variable "amis_primary_owners" {
  description = "Force the ami Owner, could be (self) or specific (id)"
  default     = ""
}

variable "amis_os_map_regex" {
  description = "Map of regex to search amis"
  type        = map(string)

  default = {
    ubuntu       = "^ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-.*"
    ubuntu-14-04 = "^ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-.*"
    ubuntu-16-04 = "^ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-.*"
    ubuntu-18-04 = "^ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-.*"
    ubuntu-18-10 = "^ubuntu/images/hvm-ssd/ubuntu-cosmic-18.10-amd64-server-.*"
    ubuntu-19-04 = "^ubuntu/images/hvm-ssd/ubuntu-disco-19.04-amd64-server-.*"
    ubuntu-20-04 = "^ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-.*"
    centos       = "^CentOS.Linux.7.*x86_64.*"
    centos-6     = "^CentOS.Linux.6.*x86_64.*"
    centos-7     = "^CentOS.Linux.7.*x86_64.*"
    centos-8     = "^CentOS.Linux.8.*x86_64.*"
    rhel         = "^RHEL-7.*x86_64.*"
    rhel-6       = "^RHEL-6.*x86_64.*"
    rhel-7       = "^RHEL-7.*x86_64.*"
    rhel-8       = "^RHEL-8.*x86_64.*"
    debian       = "^debian-stretch-.*"
    debian-8     = "^debian-jessie-.*"
    debian-9     = "^debian-stretch-.*"
    debian-10    = "^debian-10-.*"
    fedora-27    = "^Fedora-Cloud-Base-27-.*-gp2.*"
    amazon       = "^amzn-ami-hvm-.*x86_64-gp2"
    amazon-2_lts = "^amzn2-ami-hvm-.*-gp2"
    suse-les     = "^suse-sles-12-sp\\d-v\\d{8}-hvm-ssd-x86_64"
    suse-les-12  = "^suse-sles-12-sp\\d-v\\d{8}-hvm-ssd-x86_64"
  }
}

variable "amis_os_map_owners" {
  description = "Map of amis owner to filter only official amis"
  type        = map(string)
  default = {
    ubuntu       = "099720109477" #CANONICAL
    ubuntu-14-04 = "099720109477" #CANONICAL
    ubuntu-16-04 = "099720109477" #CANONICAL
    ubuntu-18-04 = "099720109477" #CANONICAL
    ubuntu-18-10 = "099720109477" #CANONICAL
    ubuntu-19-04 = "099720109477" #CANONICAL
    ubuntu-20-04 = "099720109477" #CANONICAL
    rhel         = "309956199498" #Amazon Web Services
    rhel-6       = "309956199498" #Amazon Web Services
    rhel-7       = "309956199498" #Amazon Web Services
    rhel-8       = "309956199498" #Amazon Web Services
    centos       = "679593333241"
    centos-6     = "679593333241"
    centos-7     = "679593333241"
    centos-8     = "679593333241"
    debian       = "679593333241"
    debian-8     = "679593333241"
    debian-9     = "679593333241"
    debian-10    = "136693071363"
    fedora-27    = "125523088429" #Fedora
    amazon       = "137112412989" #amazon
    amazon-2_lts = "137112412989" #amazon
    suse-les     = "013907871322" #amazon
    suse-les-12  = "013907871322" #amazon
  }
}
