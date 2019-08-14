#!/bin/sh
mlflow_port=$1
if [ -z "$mlflow_port" ]; then echo warn: start with default port 8111; mlflow_port=8111; fi
nohup mlflow server --host 0.0.0.0 --port $mlflow_port --gunicorn-opts "--timeout=120" &
