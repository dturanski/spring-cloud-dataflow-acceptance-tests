#!/usr/bin/env bash

load_file "$PWD/env.properties"
if [[ $STREAM_APPS_VERSION == *"latest"* ]]; then
  STREAM_REGISTRATION_RESOURCE=https://dataflow.spring.io/rabbitmq-kafka-latest
fi
if [[ $TASK_APPS_VERSION == *"latest"* ]]; then
  TASK_REGISTRATION_RESOURCE=https://dataflow.spring.io/task-kafka-latest
fi
