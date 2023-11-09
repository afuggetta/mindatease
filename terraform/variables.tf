variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources"
  type        = string
  default     = "AZ-RG-EASTUS2-MINDATEASE"
}

variable "app_service" {
  description = "App service specs"
  type        = map(string)
  default     = {
    name = "AZ-APSVC-EASTUS2-MINDATEASE"
    sku_size  = "F1"
    ski_tier  = "Free"
    kind = "Linux"
  }
}