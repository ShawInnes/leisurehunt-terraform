#!/bin/sh

pushd webapp
zip -jr cloudfront_lambda.zip cloudfront_lambda.js 
popd

