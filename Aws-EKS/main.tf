data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr

 tags = {
   Name = "vpc-eks"
 }
}

resource "aws_subnet" "public_subnet" {
 count                   = 2
 vpc_id                  = aws_vpc.main.id
 cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
 availability_zone       = data.aws_availability_zones.available.names[count.index]
 map_public_ip_on_launch = true

 tags = {
   Name = "public-subnet-${count.index}"
 }
}

resource "aws_internet_gateway" "main" {
 vpc_id = aws_vpc.main.id

 tags = {
   Name = "igw-eks"
 }
}

resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id

 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.main.id
 }

 tags = {
   Name = "route-table-eks"
 }
}

resource "aws_route_table_association" "aws_rt" {
 count          = 2
 subnet_id      = aws_subnet.public_subnet.*.id[count.index]
 route_table_id = aws_route_table.public.id
}

module "eks" {
 source  = "terraform-aws-modules/eks/aws"
 version = "~> 20.31"
 cluster_name    = var.cluster_name
 cluster_version = var.cluster_version
 cluster_endpoint_public_access = true
 enable_cluster_creator_admin_permissions = true

 eks_managed_node_groups = {
   example = {
     instance_types = var.node_instance_types
     min_size       = var.node_min_size 
     max_size       = var.node_max_size
     desired_size   = var.node_desired_size
   }
 }

 vpc_id     = aws_vpc.main.id
 subnet_ids = aws_subnet.public_subnet.*.id

 tags = {
   Environment = "dev"
   Terraform   = "true"
 }
}

resource "aws_ecr_repository" "aws_ecr" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "demo-avi-ecr"
  }
}