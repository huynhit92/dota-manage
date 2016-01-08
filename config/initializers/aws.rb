# resource = YAML.load(File.read("#{Rails.root}/config/aws.yml"))[Rails.env]
# creds = Aws::Credentials.new(resource["access_key_id"], resource["secret_access_key"])
# Aws.config[:region] = 'ap-northeast-1'
# Aws.config[:credentials] = creds
#
# $cloudsearch = Aws::CloudSearch::Client.new
# $csd = Aws::CloudSearchDomain::Client.new(:endpoint => "http://search-#{Rails.application.config.cloudsearch_host}.ap-northeast-1.cloudsearch.amazonaws.com")
#
# $emr = Aws::EMR::Client.new
# $s3 = Aws::S3::Client.new
