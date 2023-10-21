#!/bin/bash

# Any content that ends with "css, jpg, jpeg, js, json, png, mp4, pdf"
sources=(css jpg jpeg js json png mp4 pdf)

# result
for result in ${sources[@]};
    do echo http://localhost:6000/test.$result ; curl -I http://localhost:6000/test.${result};
done