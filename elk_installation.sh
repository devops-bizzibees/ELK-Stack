#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt-get update -y

# Install Elasticsearch
echo "Installing Elasticsearch..."
sudo apt-get install -y elasticsearch

# Enable and start Elasticsearch service
echo "Enabling and starting Elasticsearch..."
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

# Install Logstash
echo "Installing Logstash..."
sudo apt-get install -y logstash

# Enable and start Logstash service
echo "Enabling and starting Logstash..."
sudo systemctl enable logstash
sudo systemctl start logstash

# Install Kibana
echo "Installing Kibana..."
sudo apt-get install -y kibana

# Enable and start Kibana service
echo "Enabling and starting Kibana..."
sudo systemctl enable kibana
sudo systemctl start kibana

# Verify the status of each service
echo "Checking status of services..."
sudo systemctl status elasticsearch
sudo systemctl status logstash
sudo systemctl status kibana

echo "ELK Stack installation and setup completed."
