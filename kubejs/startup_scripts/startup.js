StartupEvents.registry(`block`, (event) => {
	event.create(`shovel`)
		.box(0, 0, 0, 16, 2, 16)
	event.create(`tablet`)
		.box(0, 0, 0, 16, 2, 16)
		.noItem()
	event.create(`machine`)
		.tagBlock(`mineable/pickaxe`)
})

StartupEvents.registry(`item`, (event) => {
	event.create(`electronic_parts`)
	event.create(`tablet`, `pickaxe`)
		.tier(`wood`)
		.maxDamage(14)
	event.create(`bosss_id_card`)
		.displayName(`Boss's ID Card`)
})
