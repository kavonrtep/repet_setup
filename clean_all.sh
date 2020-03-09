#!/bin/bash

rm -rf shared/*
docker container stop repet
docker container rm repet
