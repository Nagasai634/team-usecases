#!/bin/bash
set -e
sudo apt update -y
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
