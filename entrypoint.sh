#!/bin/bash

if [ -z $TARGET ]; then
    echo "ERROR: No TARGET environmental variable set, please set one at runtime, for example \"-e TARGET=http://web\""
    exit 1
fi

echo "
default:
  extensions:
    Behat\MinkExtension:
      base_url:  '$TARGET'
      sessions:
        default:
          goutte: ~
" > /code/behat.yml

# Run the behat tests
/code/vendor/bin/behat -c /code/behat.yml