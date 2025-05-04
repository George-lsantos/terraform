resource "aws_s3_bucket" "bucket" {
  bucket = "bctluisv1"

  tags = {
    Name        = "Bucket"
    Environment = "Laboratorio"
  }
}

#Habilitar versionamento em um bucket do S3: version aws_s3_bucket_versioning
resource "aws_s3_bucket_versioning" "versioning_version" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
#Deixar acesso public no S3
resource "aws_s3_bucket_public_access_block" "public-s3" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#Habilitar Logs
resource "aws_s3_bucket_ownership_controls" "log_bucket_ownership" {
  bucket = aws_s3_bucket.log-bucket.id

  rule {
    object_ownership = "ObjectWriter"
  }
}


#Cria um bucket separado chamado my-tf-log-bucket
resource "aws_s3_bucket" "log-bucket" {
  bucket = "my-tf-log-bucket45545"
}

#Essa ACL especial (log-delivery-write) permite que o serviço de logs da AWS grave nesse bucket.
#É obrigatória para que o Amazon S3 consiga entregar logs no bucket de log.
resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.log-bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "example" {
  bucket = aws_s3_bucket.bucket.id

  target_bucket = aws_s3_bucket.log-bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_object" "object" {
  bucket = "bctluisv1"  # Nome do bucket
  key    = "temp/Nov"  # Nome do arquivo no S3
  source = "C:/temp/Nov"  # Caminho do arquivo no sistema local

  etag   = filemd5("C:/temp/Nov")  # Gera o hash MD5 do arquivo
}
