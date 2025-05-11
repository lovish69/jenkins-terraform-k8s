# resource "random_id" "random" {
#     byte_length = 8
  
# }

# resource "aws_s3_bucket" "main" {
#     bucket = "mybucket-${random_id.random.hex}"
  
#     tags = {
#       name        = "mybucket"
#     }
  
    
  
# }