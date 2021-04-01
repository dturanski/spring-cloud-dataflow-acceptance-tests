#!/usr/bin/env bash
source ../../$PLATFORM/common.sh
run_scripts "$PWD" "config.sh"

create_service $DATAFLOW_SERVICE_INSTANCE_NAME "$DATAFLOW_SERVICE_NAME $DATFLOW_TILE_CONFIGURATION" $DATAFLOW_PLAN_NAME 



