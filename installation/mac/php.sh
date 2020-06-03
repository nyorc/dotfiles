#!/bin/bash

brew install php
brew install composer

composer global require "squizlabs/php_codesniffer=*"
composer global require "phpmd/phpmd=@stable"
composer global require "friendsofphp/php-cs-fixer"
