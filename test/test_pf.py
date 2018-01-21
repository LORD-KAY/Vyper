#!/bin/python
import os
import platform
class TestPlatform(object):
	"""docstring for Platform"""
	def __init__(self):
		super(TestPlatform, self).__init__()

	"""getting the platform name"""
	def opsys_name(self):
		os_name = platform.system()
		return os_name

	"""getting the kernel version"""
	def kernel_vs(self):
		release = platform.release();
		return release;

	"""getting the machine name """
	def arch_type(self):
		architecture = platform.machine();
		return architecture;

	""" getting the distribution """
	def dist(self):
		distribution = platform.dist();
		return distribution;
	
	def dist_version(self):
		distribution_vs = platform.version();
		return distribution_vs;
		