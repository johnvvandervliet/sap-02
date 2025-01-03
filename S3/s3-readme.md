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
