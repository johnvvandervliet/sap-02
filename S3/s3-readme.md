### Introduction to S3
what is object storage
A data storage architecture that manages data as objects, ass opposed to other storage architectures

- S3 provides you with *unlimited storage
- Yoy don't need to think about the underlying infrastructure
- S3 console provides an interface for you to upload and access your data

  ### an S3 Object
  objects contain your data. They ar like files. Oject may consist of:
  - Key: this is the name of the object
  - Value: the data itself made up of a sequence of bytes
  - Version ID: when the versioning enabled, the version of the object
  - Metadata: additional information attached to the object
 
  ### an S3 Bucket
  Buckets hold ojects. Buckets can also have folders "Prefixes" wich in turn hold objects
  S3 is a universal namespace, so bucket names must be unique (like a DNS record)
  you can store an individual ojbect from 0 bytes to 5 TB is Size


  # S3 CLI Common Operations
  the console now has 7 tabs across the top
  - Objects
  - Metadata
  - Properties
  - Permissions
  - Metrics
  - Management
  - Access Points
 
  - 

  export AWS_CLI_AUTO_PROMPT = on-partial
    4  export AWS_CLI_AUTO_PROMPT=on-partial
    5  env
    6  env | grep AWS_CLI_AUTO_PROMPT
    7  clear
    8  aws s3
    9  aws s3api list-buckets --query "Buckets[].Name"
   10  pwd
   11  export AWS_CLI_AUTO_PROMPT=on-partial
   12  clear
   13  aws s3 cp john.jpg s3://my-example-bucket-jv1/
   14  pwd
   15  aws s3 cp ./john.jpg s3://my-example-bucket-jv1/
   16  ls
   17  aws s3 cp /home/cloudshell-user/john.jpg s3://my-example-bucket-jv1/
   18  ls -la
   19  aws s3 cp john.jpeg s3://my-example-bucket-jv1/
   20  ls
   21  aws s3 sync /home/cloudshell-user/ s3://my-example-bucket-jv1/
   22  rm john.jpeg 
   23  ls
   24  aws s3 cp s3://my-example-bucket-jv1/john.jpeg ./
   25  ls
   26  aws s3api list-objects --bucket my-example-bucket-jv1 --query "Contents[].Key"
   27  aws s3 rm s3://my-example-bucket-jv1/john.jpeg
   28  aws s3 rm s3://my-example-bucket-jv1/ --recursive
   29  aws s3api delete-bucket --bucket my-example-bucket-jv1
