#!/usr/bin/python

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
import sys
import json

if __name__ == '__main__':
  if len(sys.argv) != 3:
    sys.exit(1)

  with open(os.path.expanduser("~/.phones.json"), "r") as fd:
    db = json.load(fd)
  if sys.argv[1] == "name":
    for k, v in db.iteritems():
      if v == sys.argv[2]:
        print(k)
    sys.exit(1)
  elif sys.argv[1] == "serial":
    if sys.argv[2] in db:
      print(db[sys.argv[2]])
    else:
      sys.exit(1)
  else:
    sys.exit(1)
