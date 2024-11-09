ELK Stack Setup for Nginx Log Processing and Bandwidth Calculation
This project contains a shell script and Logstash pipeline configuration file for setting up the ELK Stack (Elasticsearch, Logstash, Kibana) to collect and analyze application logs from an Nginx server. It specifically enables calculating bandwidth usage per user based on data from Nginx access logs.

Features
Automated ELK Stack Installation: Install Elasticsearch, Logstash, and Kibana with a single shell script.
Log Processing: Ingest and parse Nginx logs, extracting relevant fields for user activity and bandwidth calculation.
User Bandwidth Calculation: Aggregate and calculate bandwidth usage per user, making it easy to track and visualize usage patterns.
Customizable Kibana Dashboards: Visualize user activity, bandwidth usage trends, and resource allocation metrics.


Copy the nginx-pipeline.conf file to the logastach conf folder

sudo cp nginx-pipeline.conf /etc/logstash/conf.d/nginx-pipeline.conf
sudo systemctl restart logstash



Verify Setup in Kibana:
Access Kibana: Open a browser and go to http://localhost:5601.
Create Index Pattern: In Kibana, create an index pattern to visualize data from the nginx-logs-* index.
Build Dashboards: Utilize Kibana’s tools to create dashboards displaying:
Bandwidth per User: Aggregate bandwidth usage per IP address.
Usage Trends: Track bandwidth usage over time to identify peak periods.


Below mentioned is the sample query for bandwidth usage calculation:

GET /nginx-logs-*/_search
{
  "size": 0,
  "aggs": {
    "bandwidth_per_user": {
      "terms": {
        "field": "clientip",
        "size": 10
      },
      "aggs": {
        "total_bandwidth": {
          "sum": {
            "field": "bytes"
          }
        }
      }
    }
  }
}
