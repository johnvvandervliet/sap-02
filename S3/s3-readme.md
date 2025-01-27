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
 
  # S3 Objects ETags
- Entity tag, MD5 hash that data in an object changed. Not meta data changes
- used for revalidation for caching systems
- etag is part of the HTTP protocal
- Progamatic detect changes in s3 objects

# checksums
- you can change the checksum used in s3
- CRC32
- CRC32C
- SHA1
- SHA256
- verify data integrity of files on the upload or download

# additional check sums

  
 
  q inline enable
  

  1 export AWS_CLI_AUTO_PROMPT = on-partial
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


  $ export AWS_CLI_AUTO_PROMPT=on-partial
  $ env | grep AWS_CLI

  Note to use
  $ aws s3
  > aws s3 "it then gives you the prompt with suggestions"
  >
  
  aws s3api create-bucket --bucket my-example-bucket-04-01-2025-jv --region us-east-1
  aws s3api list-buckets
  
  -- using jmespath
aws s3api list-buckets --query Buckets[].Name
aws s3api list-buckets --query Buckets[].Name --output table
aws s3api list-buckets --query "Buckets[?Name == 'my-example-bucket-04-01-2025-jv']"


  
---
The ./sync my-new-shiny-bucket-jv files
worked well the issue I had was a missing "$" on the bucket variable 
steps are run the "batch-operations/create_files" script
then run the "bash-scripts/sync" command and that works well



---
### S3 Overview
S3 buckets are infrastructure and they hold s3 objects
- S3 Bucket Naming Rules
- S3 Bucket Restrictions
- S3 Bucket Types
- S3 Bucket Folders
- Bucket Versioning
- Bucket Encryption
- Static Web Hosting

# Naming Rules
- Length: Bucket names must be 3-36 characters long
- Characters: only lowercase letters, numbers, dots (.) and hyphens(-) are allowed.
- Start and End: they must begin and end with letter or number
- Adjacent Periods: not allowed
- IP Address Format: names can't be formatted as IP addresses (198.182.54.1)
- Restricted Prefixes : Can't start with "xn--", "s3alias",“amzn-s3-demo”, "sthree-", or "sthree-configurator".
- Restricted Suffixes: , "--x-s3" "-s3alias", --ol-s3, ".mrap"
- Uniqueness: must be unique across all AWS accounts in all AWS Reginos
- Exclusivity: name can't be reused until orignal is deleted
- Partitions: "aws" (standard Regions), "aws-cn" (China Regions), "aws-us-gov" ( AWS GovCloud US)
- Transfer Acceleration: Buckets used with S3 Transfer Acceleration can't have dots in their names

# S3 Bucket Restrictions
- you can by default, create 100 buckets
  - you need a service ticket to increase to 1000
- You need to empty a bucket first before you can delete it
- No Max size on buckets, no limit on number of objects in a bucket
  - files can be 0 to 5TBs
  - Files larger than 100MB should use multi-part upload
  - S3 for outpost has limits
- Get, Put, List and Delete operations are designed for high availability
    - Creat, Delete or configuration optiosn should be run less often
 
# S3 Bucket Types
Two Types of Buckets
- General Purpose
    - Organizes data in a flat Hierarchy
    - the original S3 bucket type
    - recommened for most use cases
    - Used with all storage calsses except can't be used with S3 Express One Zone storage class
    - there aren't prefix limits
    - there is a default limit of 100 general buckets per account
      
- Directory Buckets
  - Organizes data folder Hierarchy
  - only to be used with S3 Express One Zone storage class
  - Recommened when you need single-digit millisecond performance on PUT and GET
  - There aren't prefix limits for directory buckets
  - There is a limit of 10 directory buckets per account
  - Individual directories can scale horizontally

 # S3 Bucket Folders
 - When you create a folder in S3 Console, S3 creates a zero-byte S3 object with a name that ends in a forward slash eg. myfolder/
- S3 folders are note their own indepent identies but just s3 objects
- S3 folders don't include metadata, persmissions
- S3 folders don't conaint anything, they can't be full or empty
- S3 Folders arn't "moved", Objects contians the same prefix are renamed.

# S3 Object Overview
- Etags - a way to detect when the contents of an object had changed without download to content
- Checksums - unsures the integrity of a files being uploaded or downloaded
- Object Prefixes - simulates file-system folders in a flat hierarchy
- Object Metadata - attache data alonside the content, to describe the contents of the data
- Object tags - benfits resource tagging but at the object level
- Ojbect Locking - makes data files immutable
- Object Versioning - have mulitple version of a data file.

  
  
  

  
  
