"variables": {
		"client_id": "{{env `ARM_CLIENT_ID`}}",
		"client_secret": "{{env `ARM_CLIENT_SECRET`}}",
		"subscription_id": "{{env `ARM_SUBSCRIPTION_ID`}}"
    discription = "These are the service principal which should be used to build the image" 
},

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}
