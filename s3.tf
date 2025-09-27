resource "aws_s3_bucket" "my_bucket" {
     bucket =  "sambhu-bucket"
     tags = {
        Name = "sambhu-bucket" 
     }
}