#!/usr/bin/env bash

[[ -z "${CERT_URI}" ]] && { echo "CERT_URI is required"; exit 1; }
[[ -z "${DATAFLOW_SERVICE_INSTANCE_NAME}" ]] && { echo "DATAFLOW_SERVICE_INSTANCE_NAME is required"; exit 1; }

echo "getting client credentials for $DATAFLOW_SERVICE_INSTANCE_NAME"

 cf create-service-key $DATAFLOW_SERVICE_INSTANCE_NAME scdf_at
 eval $(python3 scdf_creds.py $DATAFLOW_SERVICE_INSTANCE_NAME scdf_at)

echo "importing the $CERT_URI certificate to the JDK custom trust store"
set +e
openssl s_client -connect  $CERT_URI:443 -showcerts > ${ROOT_DIR}/$CERT_URI.cer </dev/null
set -e
cp $JAVA_HOME/jre/lib/security/cacerts ${ROOT_DIR}/mycacerts
$JAVA_HOME/bin/keytool -import -alias myNewCertificate -file "${ROOT_DIR}/$CERT_URI.cer" -noprompt -keystore "${ROOT_DIR}/mycacerts" -storepass changeit
