
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# High CPU Usage Issue on GCP VM
---

This incident type refers to a problem with high CPU usage on a virtual machine (VM) hosted on Google Cloud Platform (GCP). Users may experience slow performance or even complete unresponsiveness from their VM due to the excessive processing load. To resolve the issue, users may need to run Linux commands directly on the VM or use GCP CLI compute commands to diagnose the root cause of the problem. Remediations may involve changing the instance type or resizing some aspects of the GCP VM to optimize its performance.

### Parameters
```shell
export INSTANCE_NAME="PLACEHOLDER"

export YOUR_PROJECT_ID="PLACEHOLDER"

export ZONE_OF_YOUR_VM="PLACEHOLDER"

export NAME_OF_YOUR_VM="PLACEHOLDER"

export NEW_MACHINE_TYPE="PLACEHOLDER"
```

## Debug

### 1. List all VM instances in the project
```shell
gcloud compute instances list
```

### 2. SSH into the problematic VM instance
```shell
gcloud compute ssh ${INSTANCE_NAME}
```

### 3. Check CPU usage using top command
```shell
top
```

### 4. Check CPU usage by process using ps command
```shell
ps aux | sort -nrk 3,3 | head -n 5
```

### 5. Check CPU usage by thread and sort in descending order
```shell
ps -eLo pid,ppid,%cpu,%mem,args --sort=-%cpu | head
```

## Repair

### Upgrade the VM instance type to one with more CPU cores, memory, or storage capacity to handle the workload.
```shell


#!/bin/bash



# Set the GCP project ID and zone

PROJECT_ID=${YOUR_PROJECT_ID}

ZONE=${ZONE_OF_YOUR_VM}



# Set the name of the VM instance to upgrade

INSTANCE_NAME=${NAME_OF_YOUR_VM}



# Set the new machine type to upgrade to

NEW_MACHINE_TYPE=${NEW_MACHINE_TYPE}



# Stop the VM instance

gcloud compute instances stop $INSTANCE_NAME --project=$PROJECT_ID --zone=$ZONE



# Update the machine type of the VM instance

gcloud compute instances set-machine-type $INSTANCE_NAME --project=$PROJECT_ID --zone=$ZONE --machine-type=$NEW_MACHINE_TYPE



# Start the VM instance

gcloud compute instances start $INSTANCE_NAME --project=$PROJECT_ID --zone=$ZONE


```