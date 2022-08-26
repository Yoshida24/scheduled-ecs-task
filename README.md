# scheduled-batch-job-template
CloudFormation Template for build Scheduled batch job.

## Usage

- Python: 3.10.5
- AWS CLI: 2.2.34
- Docker Desktop

## Run on local
Such as below:

```
make run
```

## Deploy
Deploy your code by AWS Management Console or AWS CLI.  

## Deploy from AWS CLI
Export property to environment variable, and run `make deploy` as below:

```bash
export ECS_AWS_ACCOUNT="000000000000"
export STACK_NAME="ScheduledBatchJobTemplateDemo"
export STACK_PROJECT="scheduled-batch-job-template-demo"
export STACK_VPC_CIDR_BLOCK="192.168.2.0/24"
export STACK_AZ="ap-northeast-1a"
export STACK_PUBLIC_SUBNET_CIDR_BLOCK="192.168.2.0/25"
export STACK_ALLOW_ECS_POLICY="s3:List*,s3:Get*,s3:Put*"
export STACK_TASK_CPU="256"
export STACK_MEMORY="1024"
export STACK_COUNT="1"
export ECR_REPO_NAME="scheduled-batch-job-template-demo"
export SCHEDULE_EXPRESSION="cron(0 9 * * ? *)"

make deploy
```
