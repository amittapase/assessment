
$rsg = "mySgrp"
$loc = "centralus"
$vmName = "suriVM" 
$imageName = "myImage"
$VirtualNetworkName = "myImageVnet" 
$SubnetName = "myImageSubnet"
$SecurityGroupName = "myImageNSG"
$PublicIpAddressName = "myImagePIP" 



# Deallocating Image 
Stop-AzVM -ResourceGroupName $rsg -Name $vmName -Force

# Generalizing VM 
Set-AzVm -ResourceGroupName $rsg -Name $vmName -Generalized

# Getting VM
$vm = Get-AzVM -Name $vmName -ResourceGroupName $rsg

# Creating Image Config
$image = New-AzImageConfig -Location $loc -SourceVirtualMachineId $vm.Id 

# Creating Image
$img = New-AzImage -Image $image -ImageName $imageName -ResourceGroupName $rsg

# Creating VM from Image 
New-AzVm 
-ResourceGroupName $rsg
-Name "myVMfromImage" 
-ImageName  $img
-Location  $loc
-VirtualNetworkName  $VirtualNetworkName
-SubnetName  $SubnetName
-SecurityGroupName  $SecurityGroupName
-PublicIpAddressName $PublicIpAddressName
-OpenPorts 3389