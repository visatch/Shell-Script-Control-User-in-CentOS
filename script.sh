#!/bin/bash
while :
do
echo "Welcome to my Delete User Shell Script" 
#echo ""
#case
echo "  1. List every user in the system
	2. Add User 
	3. Delete User
	4. Add Group
	5. Add User to Group
	6. List Group
	7. Quit  "
echo -n "Select Option below to perform the task: "
read option
clear
case "$option" in

 1) echo "Every user in the system: " 
 cat /etc/passwd |grep "/home/" |cut -d: -f1;; 

 2) echo -n "What is your username name?: "
	read add
	if [ -z "$(getent passwd $add)" ]; then
	adduser -n $add
	passwd $add
	else
	echo "$add is exist."
	fi;;

 4) echo "Add Group to the System"
	echo -n " Please enter Group Name to be put: "
	read g
	if [ -z "$(getent group $g)" ]; then
	groupadd $g
	echo "Group name $g added."
	else 
	echo "Group name $g already existed."
	fi;;

 5) echo -n "Enter Username to Add to Group: " 
	read uag
  	echo -n "Enter Group name: "
	read egn
	usermod -aG $egn $uag
	echo "Add $uag successfully";;

 6) echo "Group in the System: "
	getent group |cut -d: -f1;;
 
 7) echo "Quit"
	exit;;

 3) echo -n "Enter Username to DELETE: "
	read delete
	echo -n "Are you sure to DELETE Username $delete from the system? (yes or no): " 
		read answer 
		case "$answer" in 
			[yY][eE][sS]) userdel -r $delete
			echo "Username $delete is deleted.";; 
			
		    	[nN][oO]) echo "User delete is unsuccessful."
			exit;;	

			*) echo "Wrong input, Please try again"
			exit;;
			 esac


#clear	
esac
done
