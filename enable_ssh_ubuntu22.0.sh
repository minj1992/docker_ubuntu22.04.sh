#To ensure your script works on an Ubuntu 22.04 AWS EC2 instance using the user data option, here are the adjustments:

#Add the #!/bin/bash at the start of the script.
#Use cloud-init syntax for user data scripts.
#Remove the unnecessary commands like exit 1 which will stop the script execution if the user exists.
#Ensure correct handling of sudo commands within the user data context.
#Here’s the adjusted script:


#!/bin/bash

username="devops"
password="password"

# Create the user if it doesn't exist
if ! id "$username" &>/dev/null; then
    sudo useradd -m -s /bin/bash "$username"
    echo "$username:$password" | sudo chpasswd
    echo "$username ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"$username"
fi

# Enable SSH password authentication
sudo sed -i 's/^PasswordAuthentication\s*no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication\s*no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart sshd

echo "User $username created with password, full sudo permissions, and SSH login setup."
To use this script as user data when launching an EC2 instance:

Open the EC2 console and go through the steps to launch an instance.
In the "Configure Instance" step, find the "Advanced Details" section.
In the "User data" field, paste the script.
This will run the script on the first boot of the instance, setting up the user as required
