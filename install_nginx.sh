#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "html code by sambhu!" | sudo tee /var/www/html/index.html
