
import os
import platform
class Platform(object):
	"""docstring for Platform"""
	def __init__(self):
		super(Platform, self).__init__()

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

	""" TODO: get the overall system details in a tuple manner """
	def overall_system(self):
		sys_details = platform.uname();
		return sys_details;
		