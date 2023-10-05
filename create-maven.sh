#!/bin/bash

printf "%s" "Enter your artifact_id/project name: "
read -r project_name
printf "%s" "Enter your project group id: "
read -r group_id

# Function to ask for yes/no confirmation
ask_confirmation() {
	while true; do
		read -p "$1 (y/n): " choice
		case $choice in
		[Yy]) return 0 ;;
		[Nn]) return 1 ;;
		*) echo "Please answer yes or no." ;;
		esac
	done
}

archtype="maven-archetype-quickstart"

if ask_confirmation "Default archtype: quickstart, Do you want to change?"; then
	echo -n "Please enter new archtype: "
	read -r archtype
fi

echo "Java maven project is being initialized"
mvn archetype:generate -DgroupId="${group_id}" -DartifactId="${project_name}" -DarchetypeArtifactId="${archtype}" -DarchetypeVersion=1.4 -DinteractiveMode=false
