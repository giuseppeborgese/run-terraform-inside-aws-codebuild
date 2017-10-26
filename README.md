Why Run Terraform inside AWS Codebuild
==================================

1. Every person in the company can create infrastructure using Terraform, without any configuration in their own laptop.
2. You can provide a web interface to use Terraform and anyone in the company can create infrastructures
3. All terraform output logs are saved in Cloudwatch
4. You can run by schedule
5. You can run with an hook every time the code changes
6. You don’t need any infrastructure to run, no EC2 virtual machines no fix cost. You pay only for minutes you use
7. You can build a small orchestrator running for example a python script before and after the terraform run

Steps for this example
======================

Choose a region, everything will be created in that region

1 - run the cloudformation file
-------------------------------

This will create 3 objects:

1. A codebuild role with administrator access
2. An S3 bucket where the tfstate file will be saved
3. A codebuild project that will run the code

2 - run the codebuild to create your terraform environment
----------------------------------------------------------

To do this this is necessary click on the “Start the build" (blue button) inside codebuild.

This will trigger the creation of the security group in your environment.

Take a look to the CloudWatch logs and verify that everything is green in codebuild

The video for the steps 1 and 2 is this

[![Run Terraform inside AWS Codebuild part 1/2 creation](https://img.youtube.com/vi/sXTRS9eKlHA/0.jpg)](https://www.youtube.com/watch?v=sXTRS9eKlHA)


3 - destroy the security group running a terraform destroy
----------------------------------------------------------

1. click on "Start the build" (Blue button)
2. Change the destroy variable to True
3. click on "Start the build" (Blue button)

4 - clean the environment
-------------------------

1. empty the bucket
2. delete the cloudformation template

The video for the steps 3 and 4 is this

[![Run Terraform inside AWS Codebuild part 2/2 destroy and cleanup](https://img.youtube.com/vi/OXrfUhEK2yQ/0.jpg)](https://www.youtube.com/watch?v=OXrfUhEK2yQ)
