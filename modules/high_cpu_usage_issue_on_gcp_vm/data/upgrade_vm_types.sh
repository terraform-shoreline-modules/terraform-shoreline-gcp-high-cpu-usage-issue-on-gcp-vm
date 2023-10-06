

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