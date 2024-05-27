StartupEvents.registry("block", (event) => {
	event.create("shovel")
		.hardness(0)
		.box(0, 0, 0, 16, 2, 16)
})
StartupEvents.registry("item", (event) => {
	event.create("electronic_parts")
})
