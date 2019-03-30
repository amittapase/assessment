$rsg = "mygrp"
$loc = "centralus"
$vnetname = "playvnet"
$subnetone = "firstsn"
$subnettwo = "secondsn"
$vmName = "myVM" 
$imageName = "myImage"
$VirtualNetworkName = "myImageVnet" 
$SubnetName = "myImageSubnet"
$SecurityGroupName = "myImageNSG"
$PublicIpAddressName = "myImagePIP" 

# Creating ResourceGroup
 New-AzResourceGroup -Name $rsg -Location $loc 

# Creating Vnet 
 $vnet = New-AzVirtualNetwork  -ResourceGroupName $rsg -Location $loc -Name $vnetname -AddressPrefix "10.10.0.0/16" 

 # Subnet assocaiation 
 Add-AzVirtualNetworkSubnetConfig -Name $subnetone -AddressPrefix "10.10.1.0/24" -VirtualNetwork $vnet 
 Add-AzVirtualNetworkSubnetConfig -Name $subnettwo -AddressPrefix "10.10.2.0/24" -VirtualNetwork $vnet

$vnet | Set-AzVirtualNetwork 

# Creating VM 


New-AzVM 
  -ResourceGroupName $rsg
  -Name $vmName 
  -Location $loc
  -ImageName "ubuntu 16 LTS" 
  -VirtualNetworkName "myVnet" 
  -SubnetName "mySubnet" 
  -SecurityGroupName "myNetworkSecurityGroup" 
  -PublicIpAddressName "myPublicIp" 
  -OpenPorts 3389,80





