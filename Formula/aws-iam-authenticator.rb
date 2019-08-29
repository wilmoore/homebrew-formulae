class AwsIamAuthenticator < Formula
  desc "A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster"
  homepage "https://github.com/kubernetes-sigs/aws-iam-authenticator"
  url "https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.8/2019-08-14/bin/darwin/amd64/aws-iam-authenticator"
  sha256 "a88457e5b4292a8086ead1062bc51a7ecef6811a4845b3ee70d80dcff6a1ad33"

  def install
    bin.install "aws-iam-authenticator"
  end

  test do
    system "#{bin}/aws-iam-authenticator", "version", "2>&1"
  end
end
