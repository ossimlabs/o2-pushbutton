#!/bin/bash

autoscalers=("icarus-app" "isa-ui-app" "nifi-cluster-template" "nifi-cluster" "nifi-stateful-set" "nifi" "omar-admin-server" "omar-avro-metadata" "omar-basemap" "omar-blink" "omar-cesium-terrain-buil" "omar-cesium-terrain-serv" "omar-config-server" "omar-cucumber-backend-test" "omar-cucumber-frontend-test" "omar-cucumber-ingest-test" "omar-disk-cleanup-app" "omar-docs-app" "omar-download-app" "omar-eureka-server" "omar-geoscript-app" "omar-jpip-app" "omar-mapproxy" "omar-mensa-app" "omar-ml" "omar-oldmar-app" "omar-oms-app" "omar-pki-proxy-app" "omar-reachback-app" "omar-services-monitor-app" "omar-sqs-stager-app" "omar-sqs-stager-cucumber" "omar-sqs-stager-slow" "omar-stager-app" "omar-streetview-app" "omar-superoverlay-app" "omar-twofishes" "omar-ui-app" "omar-ui-ods-app" "omar-ui-proto" "omar-upload-app" "omar-video-ui" "omar-volume-cleanup" "omar-wcs-app" "omar-web-proxy-app" "omar-wfs-app" "omar-wms-app" "omar-wmts-app" "ossim-isa-service" "ossim-jpip-server" "rabbitmq" "tlv-app" "zookeeper-app" "zookeeper-template")

for i in "${autoscalers[@]}";
do 
	sed -i "" "s/\"name\":\ \"omar-oms-app\"/\"name\":\ \"$i\"/g" $i*; 
done

echo finished;

