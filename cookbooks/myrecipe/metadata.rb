maintainer       "Takayuki SHIMIZUKAWA"
maintainer_email "shimizukawa@beproud.jp"
license          "Apache 2.0"
description      "Installs/Configures myrecipe"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.0"
recipe           "myrecipe", "default"
recipe           "myrecipe::default_env", "for default environment"
recipe           "myrecipe::personal_env", "for personal environment"
