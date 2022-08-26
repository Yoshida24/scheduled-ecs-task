#!/usr/bin/env bash

# exit on error
set -e

# build dockerfile
docker build . \
    -t ${ECS_AWS_ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPO_NAME} \
    -f app/docker/Dockerfile

# cloudformation deploy
aws cloudformation deploy \
    --template ./template/scheduled-batch-job-template.yml \
    --stack-name ${STACK_NAME} \
    --parameter-overrides "Project=${STACK_PROJECT}" "VpcCidrBlock=${STACK_VPC_CIDR_BLOCK}" \
        "AZ=${STACK_AZ}" \
        "PublicSubnetCidrBlock=${STACK_PUBLIC_SUBNET_CIDR_BLOCK}" \
        "AllowEcsPolicy=${STACK_ALLOW_ECS_POLICY}" \
        "TaskCpu=${STACK_TASK_CPU}" \
        "TaskMemory=${STACK_MEMORY}" \
        "TaskCount=${STACK_COUNT}" \
        "ScheduleExpression=${SCHEDULE_EXPRESSION}" \
    --capabilities CAPABILITY_NAMED_IAM

# push container to ecr
aws ecr get-login-password \
    | docker login \
    --username AWS \
    --password-stdin ${ECS_AWS_ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPO_NAME}
docker push ${ECS_AWS_ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPO_NAME}