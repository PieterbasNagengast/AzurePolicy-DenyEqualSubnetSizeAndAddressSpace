[![bicepBuild](https://github.com/PieterbasNagengast/AzurePolicy-DenyEqualSubnetSizeAndAddressSpace/actions/workflows/bicepBuild.yml/badge.svg)](https://github.com/PieterbasNagengast/AzurePolicy-DenyEqualSubnetSizeAndAddressSpace/actions/workflows/bicepBuild.yml)

# Azure Policy: Deny VNETs that have equal subnet and address space size

## Description

Deny VNETs that have equal subnet and address space size. Compares if any subnet size matches any addres space on VNET.

## Background/Use case

Used in scenraio's where you want to deny the creation of VNETs that have a equal Subnet size and Address space.
Example: Landing-zone VNETs have all /24 address spaces and you don't want to the creation of /24 subnets.
If this policy is assigned:

- Creation of VNETs with equal Address space and Subnet size is denied
- Creation of smaller subnets is allowed
- Works Creating new VNET's

> **_NOTE:_** This policy allows the creation of subnets to existing VNET's with equal Address space and Subnet size. VNET will be marked as non-compliant in Azure Policy dash.

## Deploy

1. Deploy Policy to Management Group or Subscription level.
2. Assign policy

| Description | Bicep Template |
|---|---|
| Deploy to Azure Management Group| [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPieterbasNagengast%2FAzurePolicy-DenyEqualSubnetSizeAndAddressSpace%2Fmain%2FSubnetNotEqualToAddressSpace-MgmtGrp.json)|
| Deploy to Azure Subscription | [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FPieterbasNagengast%2FAzurePolicy-DenyEqualSubnetSizeAndAddressSpace%2Fmain%2FSubnetNotEqualToAddressSpace-Sub.json)|
