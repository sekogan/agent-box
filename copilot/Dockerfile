ARG COMMON_IMAGE=agent-box-common:latest
FROM ${COMMON_IMAGE}

ARG USER_NAME=user

USER root
RUN npm install -g @github/copilot
USER ${USER_NAME}

ENTRYPOINT ["copilot", "--yolo"]
