#### Terraform AWS EKS Cluster with VPC and ECR
This Terraform configuration deploys an EKS (Elastic Kubernetes Service) cluster on AWS with the following components:
- A new VPC with public subnets, internet gateway, and public route tables
- An EKS cluster with managed node groups
- An ECR (Elastic Container Registry) repository to store Docker images

#### Prerequisites:
```Terraform >= 1.0```
- AWS CLI configured with sufficient permissions
- AWS Account with appropriate IAM permissions for VPC, EKS, and ECR
- kubectl and aws-iam-authenticator installed (to interact with EKS)
### Features:
- Creates a VPC with 2 public subnets across availability zones
- Internet gateway and public route table setup for internet access
- EKS cluster version configurable
- Managed node group with configurable instance types and autoscaling
- Private ECR repository for container images
### Usage
#### 1. Clone this repository
```bash
git clone <repo-url>
cd  Aws-EKS
```
#### 2. Customize variables
Edit variables.tf or create a terraform.tfvars file to override defaults:
```hcl
vpc_cidr        = "10.0.0.0/16"
cluster_name    = "my-eks-cluster"
cluster_version = "1.23"
node_instance_types = ["t3.medium"]
node_min_size   = 2
node_max_size   = 3
node_desired_size = 2
ecr_repo_name   = "my-app-ecr"
```

#### 3. Initialize Terraform
```bash
terraform init
terraform init \
  -backend-config="bucket=YOUR_BUCKET_NAME" \
  -backend-config="key=avin-test.tfstae" \
  -backend-config="region=AWS_REGION"
```
####  4. Plan Terraform deployment
```bash
terraform plan
```
#### 5. Apply Terraform configuration
```bash
terraform apply
```
- Public subnet IDs
- EKS cluster endpoint and ARN
- ECR repository URL
#### Note: 
- You can add outputs in your Terraform code as needed
- Ensure your AWS credentials are configured (via aws configure or environment variables)
- Modify node group size and instance types according to your workload needs
- For production use, consider adding private subnets, NAT gateways, and additional security groups
#### Cleanup
To destroy all resources created:
```bash
terraform destroy
```