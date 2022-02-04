targetScope = 'subscription'

resource policy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'Deny VNETs that have equal subnet and address space size'
  properties: {
    policyType: 'Custom'
    description: 'Deny VNETs that have equal subnet and address space size. Compares if any subnet size matches any addres space on VNET. Deny effect works at VNET creation time.'
    displayName: 'Deny VNETs that have equal subnet and address space size'
    mode: 'All'
    metadata: {
      'Category': 'Network'
    }
    parameters: {
      'effect': {
        'type': 'String'
        'metadata': {
          'displayName': 'Effect'
          'description': 'Enable or disable the execution of the policy.'
        }
        'allowedValues': [
          'audit'
          'deny'
          'disabled'
        ]
        'defaultValue': 'deny'
      }
    }
    policyRule: {
      'if': {
        'allOf': [
          {
            'field': 'type'
            'equals': 'Microsoft.Network/virtualNetworks'
          }
          {
            'count': {
              'field': 'Microsoft.Network/virtualNetworks/subnets[*]'
              'where': {
                'field': 'Microsoft.Network/virtualNetworks/subnets[*].addressPrefix'
                'in': '[field(\'Microsoft.Network/virtualNetworks/addressSpace.addressPrefixes[*]\')]'
              }
            }
            'greater': 0
          }
        ]
      }
      'then': {
        'effect': '[parameters(\'effect\')]'
      }
    }
  }
}
