# webserver_migrate
migration of web server from private datacenter to AWS

to imrove the infrastructure, plan to migrate non-public webserver in a private datacenter to AWS

make sure aws cli is installed and configured along with terraform as a IaC for this setup, plan and apply

the plan is to have EC2 running on AWS ready with webserver and route53 is pointing to private datacenter

then shift traffic webserver running on EC2 on AWS
