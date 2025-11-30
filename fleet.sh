curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.19.7-linux-x86_64.tar.gz
tar xzvf elastic-agent-8.19.7-linux-x86_64.tar.gz
cd elastic-agent-8.19.7-linux-x86_64
sudo ./elastic-agent install \
  --fleet-server-es=https://192.168.20.252:9200/ \
  --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3NjQzNDU0NzcxNDE6T2VZenhrM3VUM3l0QXJnMkdtR0JmZw \
  --fleet-server-policy=fleet-server-policy \
  --fleet-server-es-ca-trusted-fingerprint=3e4b1c44ce752286b2d16d98a4fa6c0eaa606d2b4bee948c9cd72c121e6f1b8f \
  --fleet-server-port=8220
