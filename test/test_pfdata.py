#!/bin/python
from test_pf import TestPlatform

killer = TestPlatform()
name = killer.opsys_name()
print(name)