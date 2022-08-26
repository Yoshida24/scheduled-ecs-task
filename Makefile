.PHONY: run
run:
	python app/src/main.py

.PHONY: docker-build
docker-build:
	docker build . -t ${ECS_AWS_ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPO_NAME} -f app/docker/Dockerfile

.PHONY: docker-run
docker-run:
	docker run -it ${ECS_AWS_ACCOUNT}.dkr.ecr.ap-northeast-1.amazonaws.com/${ECR_REPO_NAME} --rm

.PHONY: deploy
deploy: 
	sh ./scripts/deploy.sh
	@echo "deploy completed."
