# Terraform Networking Module

This project is a Terraform configuration for creating a Virtual Private Cloud (VPC) in AWS. It includes the setup of public and private subnets, a security group for SSH access, and outputs for key network components. 

## Project Structure

The project consists of the following files:

- **`backend.tf`**: Configuration for the Terraform backend to store state information.
- **`LICENSE`**: License file for the project.
- **`main.tf`**: Main Terraform configuration defining the resources to be created.
- **`outputs.tf`**: Defines output values for the created resources.
- **`provider.tf`**: Provider configuration for AWS.
- **`variables.tf`**: Input variables for customization of the Terraform module.

## Features

- **VPC Creation**: A customizable VPC is created based on provided CIDR block.
- **Subnet Management**: Creates public and private subnets based on the provided CIDR block lists.
- **Security Group**: A security group is created to allow SSH access from the VPC.
- **Output Values**: Outputs the IDs of the created VPC and subnets for easy reference.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- An AWS account with permissions to create VPCs, subnets, and security groups.
- AWS credentials configured locally or exported as environment variables.

### Configuration

1. Clone the repository to your local machine:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   

2. Open `variables.tf` and configure the variables as needed. The defaults are:
   - `vpc_cidr`: "10.0.0.0/16"
   - `public_subnet_cidr`: ["10.0.1.0/24", "10.0.2.0/24"]
   - `private_subnet_cidr`: ["10.0.3.0/24", "10.0.4.0/24"]

3. Initialize the Terraform workspace:
   ```bash
   terraform init
   

4. Review the Terraform plan:
   ```bash
   terraform plan
   

5. Apply the changes to create the VPC and associated resources:
   ```bash
   terraform apply
   

6. After the apply completes, you can view the output values for your setup.

### Outputs

After successful execution, the following output values will be available:

- **`vpc_id`**: The ID of the created VPC.
- **`public_subnet_id`**: The list of IDs of the public subnets created.
- **`private_subnet_id`**: The list of IDs of the private subnets created.

## Backend Configuration

The state of your Terraform infrastructure will be stored in an S3 bucket specified in `backend.tf`. The `dynamodb_table` is used for state locking to prevent concurrent modifications.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.

## Acknowledgments

This project utilizes the [Terraform AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) to manage AWS resources. 

For more detailed instructions, check the official Terraform [documentation](https://www.terraform.io/docs/index.html).
