1. Add the server IPs in control machine
    open /etc/hosts file and add the following lines as an example
    192.168.3.40 control.example.com    control
    192.168.2.40 ansible1.example.com   ansible1
    192.168.5.40 ansible2.example.com   ansible2

2. Later create user e.g. ansible with admin privileges in all three machines

3. Verify the user ansilbe in all the machines
    3.1 id ansible (on control node)
    3.2 ssh ansible1 id ansible (on managed node ansible1)
    3.3 ssh ansible2 id ansible (on managed node ansible2)

4. Setup the user accounts to run sudo tasks without being prompted for password
    4.1 visudo (on control node and managed nodes) and make the following changes
        ## Same thing without a password
            %wheel        ALL=(ALL)       NOPASSWD: ALL (=> uncomment the below line)
        ## Allows people in group wheel to run all commands
            # %wheel  ALL=(ALL)       ALL (=> comment the below line)

5. Come out of root mode and log back as ansible user. Generate ssh key on control node for user ansible
    5.1 ssh-keygen

6. Copy the public to all managed nodes
    6.1 ssh-copy-id ansible1
    6.2 ssh-copy-id ansible2

7. Install Python on managed nodes
    7.1 ssh root@ansible1
    7.2 yum search pyhton
    7.3 yum install python

8. Install ansible in all the machines
    8.1 check the OS details -> sudo cat /etc/os-release
    8.2 install epel repo -> sudo yum install epel-release -y
    8.3 install ansible package -> sudo yum install -y ansible

9. Create inventory ansible.cfg file inside the project root directory