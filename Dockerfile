ARG ALPINE_VERSION=3.15

FROM alpine:${ALPINE_VERSION}

ARG AWS_CDK_VERSION
ENV CDK_VERSION ${AWS_CDK_VERSION}
RUN apk -v --no-cache --update add \
        nodejs \
        npm \
        python3 \
        py3-pip \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        wget \
        zip \
        git \
        && \
    update-ca-certificates && \
    npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

# Allow for caching python modules
VOLUME ["/usr/lib/python3.8/site-packages/"]

WORKDIR /opt/app

RUN pip install --upgrade pip \
        aws-cdk.core==${AWS_CDK_VERSION} \
        aws-cdk.assets==${AWS_CDK_VERSION} \
        aws-cdk.aws-apigateway==${AWS_CDK_VERSION} \
        aws-cdk.aws-applicationautoscaling==${AWS_CDK_VERSION} \
        aws-cdk.aws-athena==${AWS_CDK_VERSION} \
        aws-cdk.aws-autoscaling==${AWS_CDK_VERSION} \
        aws-cdk.aws-autoscaling-common==${AWS_CDK_VERSION} \
        aws-cdk.aws-autoscaling-hooktargets==${AWS_CDK_VERSION} \
        aws-cdk.aws-batch==${AWS_CDK_VERSION} \
        aws-cdk.aws-certificatemanager==${AWS_CDK_VERSION} \
        aws-cdk.aws-cloudformation==${AWS_CDK_VERSION} \
        aws-cdk.aws-cloudfront==${AWS_CDK_VERSION} \
        aws-cdk.aws-cloudwatch==${AWS_CDK_VERSION} \
        aws-cdk.aws-codeguruprofiler==${AWS_CDK_VERSION} \
        aws-cdk.aws-codestarnotifications==${AWS_CDK_VERSION} \
        aws-cdk.aws-cognito==${AWS_CDK_VERSION} \
        aws-cdk.aws-ec2==${AWS_CDK_VERSION} \
        aws-cdk.aws-ecr==${AWS_CDK_VERSION} \
        aws-cdk.aws-ecr-assets==${AWS_CDK_VERSION} \
        aws-cdk.aws-ecs==${AWS_CDK_VERSION} \
        aws-cdk.aws-efs==${AWS_CDK_VERSION} \
        aws-cdk.aws-elasticache==${AWS_CDK_VERSION} \
        aws-cdk.aws-elasticloadbalancing==${AWS_CDK_VERSION} \
        aws-cdk.aws-elasticloadbalancingv2==${AWS_CDK_VERSION} \
        aws-cdk.aws-events==${AWS_CDK_VERSION} \
        aws-cdk.aws-globalaccelerator==${AWS_CDK_VERSION} \
        aws-cdk.aws-glue==${AWS_CDK_VERSION} \
        aws-cdk.aws-iam==${AWS_CDK_VERSION} \
        aws-cdk.aws-kms==${AWS_CDK_VERSION} \
        aws-cdk.aws-lambda==${AWS_CDK_VERSION} \
        aws-cdk.aws-logs==${AWS_CDK_VERSION} \
        aws-cdk.aws-route53==${AWS_CDK_VERSION} \
        aws-cdk.aws-route53-targets==${AWS_CDK_VERSION} \
        aws-cdk.aws-s3==${AWS_CDK_VERSION} \
        aws-cdk.aws-s3-deployment==${AWS_CDK_VERSION} \
        aws-cdk.aws-s3-assets==${AWS_CDK_VERSION} \
        aws-cdk.aws-sam==${AWS_CDK_VERSION} \
        aws-cdk.aws-secretsmanager==${AWS_CDK_VERSION} \
        aws-cdk.aws-servicediscovery==${AWS_CDK_VERSION} \
        aws-cdk.aws-signer==${AWS_CDK_VERSION} \
        aws-cdk.aws-sns==${AWS_CDK_VERSION} \
        aws-cdk.aws-sns-subscriptions==${AWS_CDK_VERSION} \
        aws-cdk.aws-sqs==${AWS_CDK_VERSION} \
        aws-cdk.aws-ssm==${AWS_CDK_VERSION} \
        cdk-ecr-deployment==1.0.2

CMD ["cdk", "--version"]
