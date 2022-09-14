module_directory modules platform

bin_directory bin

target_directory target

module core
	library
	build compile link

module windows
	library
	dependency core
	build compile link

module vulkan
	library dynamic
	dependency core
	build compile
	run load

module client
	bin
	dependency core vulkan
	build compile

module builder
	bin
	dependency core
	build compile

