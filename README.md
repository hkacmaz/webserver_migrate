# webserver_migrate
migration of web server from private datacenter to AWS

to imrove the infrastructure, plan to migrate non-public webserver in a private datacenter to AWS

make sure aws cli is installed and configured along with terraform as a IaC for this setup, plan and apply

the plan is to have EC2 running on AWS ready with webserver and route53 is pointing to private datacenter

then shift traffic webserver running on EC2 on AWS

terraform IaC going to have 3 modules
- aws_initial_setup
- ec2
- traffic_shift

initial setup for setting up networking and make it secure and private
ec2 for ec2 image details and other required variables
and traffic shift for route53 and alb settings and setup
