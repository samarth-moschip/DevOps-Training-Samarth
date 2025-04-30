#this is terrform installtion on Amzon linux system

sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform


#steps to run main.tf file

First step:
	
	create dir --makdir your-directory
	
--------------------------------------------------------------
second step:
	
	write script .tf for resource creation
-----------------------------------------------------------
Third step: run below command to build main.tf file
	
	terraform init
	
	terraform validate
	
	terraform ftm
	
	terraform applly

-----------------------------------------------------------------------	
fourth step:

	terraform destory ----for deleting resources form cloud	
	
----------------------------------------------------------------------------
		
	
		
	
