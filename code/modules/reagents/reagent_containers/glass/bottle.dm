
//Not to be confused with /obj/item/reagent_containers/food/drinks/bottle

/obj/item/reagent_containers/glass/bottle
	name = "bottle"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "atoxinbottle"
	randpixel = 7
	center_of_mass = "x=15;y=10"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = "5;10;15;25;30;60"
	w_class = ITEM_SIZE_SMALL
	item_flags = 0
	obj_flags = 0
	volume = 60

/obj/item/reagent_containers/glass/bottle/on_reagent_change()
	update_icon()

/obj/item/reagent_containers/glass/bottle/pickup(mob/user)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bottle/dropped(mob/user)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bottle/attack_hand()
	..()
	update_icon()

/obj/item/reagent_containers/glass/bottle/New()
	if(!icon_state)
		icon_state = "bottle-[rand(1,4)]"
	return ..()

/obj/item/reagent_containers/glass/bottle/update_icon()
	overlays.Cut()

	if(reagents.total_volume && (icon_state == "bottle-1" || icon_state == "bottle-2" || icon_state == "bottle-3" || icon_state == "bottle-4"))
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]10")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 9)
				filling.icon_state = "[icon_state]--10"
			if(10 to 24)
				filling.icon_state = "[icon_state]-10"
			if(25 to 49)
				filling.icon_state = "[icon_state]-25"
			if(50 to 74)
				filling.icon_state = "[icon_state]-50"
			if(75 to 79)
				filling.icon_state = "[icon_state]-75"
			if(80 to 90)
				filling.icon_state = "[icon_state]-80"
			if(91 to INFINITY)
				filling.icon_state = "[icon_state]-100"

		filling.color = reagents.get_color()
		overlays += filling

	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_bottle")
		overlays += lid


/obj/item/reagent_containers/glass/bottle/inaprovaline
	name = "inaprovaline bottle"
	desc = "A small bottle. Contains inaprovaline - used to stabilize patients."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/inaprovaline/New()
	..()
	reagents.add_reagent(/datum/reagent/medicine/inaprovaline, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/kelotane
	name = "kelotane bottle"
	desc = "A small bottle. Contains kelotane - used to treat burns."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/kelotane/New()
	..()
	reagents.add_reagent(/datum/reagent/medicine/kelotane, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/dexalin
	name = "dexalin bottle"
	desc = "A small bottle. Contains dexalin - used to treat oxygen deprivation."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/dexalin/New()
	..()
	reagents.add_reagent(/datum/reagent/medicine/dexalin, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/toxin
	name = "toxin bottle"
	desc = "A small bottle of toxins. Do not drink, it is poisonous."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

/obj/item/reagent_containers/glass/bottle/toxin/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/cyanide
	name = "cyanide bottle"
	desc = "A small bottle of cyanide. Bitter almonds?"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

/obj/item/reagent_containers/glass/bottle/cyanide/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/cyanide, 30) //volume changed to match chloral
	update_icon()


/obj/item/reagent_containers/glass/bottle/stoxin
	name = "soporific bottle"
	desc = "A small bottle of soporific. Just the fumes make you sleepy."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

/obj/item/reagent_containers/glass/bottle/stoxin/New()
	..()
	reagents.add_reagent(/datum/reagent/soporific, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/chloralhydrate
	name = "Chloral Hydrate Bottle"
	desc = "A small bottle of Choral Hydrate. Mickey's Favorite!"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-3"

/obj/item/reagent_containers/glass/bottle/chloralhydrate/New()
	..()
	reagents.add_reagent(/datum/reagent/chloral_hydrate, 30)		//Intentionally low since it is so strong. Still enough to knock someone out.
	update_icon()


/obj/item/reagent_containers/glass/bottle/antitoxin
	name = "dylovene bottle"
	desc = "A small bottle of dylovene. Counters poisons, and repairs damage. A wonder drug."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/antitoxin/New()
	..()
	reagents.add_reagent(/datum/reagent/medicine/dylovene, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/mutagen
	name = "unstable mutagen bottle"
	desc = "A small bottle of unstable mutagen. Randomly changes the DNA structure of whoever comes in contact."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/mutagen/New()
	..()
	reagents.add_reagent(/datum/reagent/unstable_mutagen, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/ammonia
	name = "ammonia bottle"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/ammonia/New()
	..()
	reagents.add_reagent(/datum/reagent/ammonia, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/eznutrient
	name = "\improper EZ NUtrient bottle"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/eznutrient/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/fertilizer/ez_nutrient, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/left4zed
	name = "\improper Left-4-Zed bottle"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/left4zed/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/fertilizer/left_4_zed, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/robustharvest
	name = "\improper Robust Harvest"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/robustharvest/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/fertilizer/robust_harvest, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/diethylamine
	name = "diethylamine bottle"
	desc = "A small bottle."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/diethylamine/New()
	..()
	reagents.add_reagent(/datum/reagent/diethylamine, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/pacid
	name = "Polytrinic Acid Bottle"
	desc = "A small bottle. Contains a small amount of Polytrinic Acid."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/pacid/New()
	..()
	reagents.add_reagent(/datum/reagent/acid/polytrinic, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/adminordrazine
	name = "Adminordrazine Bottle"
	desc = "A small bottle. Contains the liquid essence of the gods."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "holyflask"


/obj/item/reagent_containers/glass/bottle/adminordrazine/New()
	..()
	reagents.add_reagent(/datum/reagent/adminordrazine, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/capsaicin
	name = "Capsaicin Bottle"
	desc = "A small bottle. Contains hot sauce."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/capsaicin/New()
	..()
	reagents.add_reagent(/datum/reagent/capsaicin, 60)
	update_icon()


/obj/item/reagent_containers/glass/bottle/frostoil
	name = "Chilly Oil Bottle"
	desc = "A small bottle. Contains cold sauce."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-4"

/obj/item/reagent_containers/glass/bottle/frostoil/New()
	..()
	reagents.add_reagent(/datum/reagent/frostoil, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/dye
	name = "dye bottle"
	desc = "A little bottle used to hold dye or food coloring, with a narrow bottleneck for handling small amounts."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-1"
	amount_per_transfer_from_this = 1
	possible_transfer_amounts = "1;2;5;10;15;25;30;60"
	var/datum/reagent/starting_reagent = /datum/reagent/dye
	var/starting_vol = 60

/obj/item/reagent_containers/glass/bottle/dye/Initialize()
	. = ..()
	reagents.add_reagent(starting_reagent, starting_vol)
	update_icon()


/obj/item/reagent_containers/glass/bottle/dye/polychromic
	name = "polychromic dye bottle"
	desc = "A little bottle used to hold dye or food coloring, with a narrow bottleneck for handling small amounts. \
			Outfitted with a tiny mechanism that can change the color of its contained dye, opening up infinite possibilities."

/obj/item/reagent_containers/glass/bottle/dye/polychromic/attack_self(mob/living/user)
	var/datum/reagent/heldDye = reagents.get_reagent(starting_reagent)
	if (!heldDye)
		to_chat(user, "<span class='warning'>\The [src] isn't holding any dye!</span>")
		return
	var/new_color = input(user, "Choose the dye's new color.", "[name]") as color|null
	if (!new_color || !Adjacent(user))
		return
	to_chat(user, SPAN_NOTICE("The dye in \the [src] swirls and takes on a new color."))
	heldDye.color = new_color
	update_icon()

/obj/item/reagent_containers/glass/bottle/dye/polychromic/strong
	starting_reagent = /datum/reagent/dye/strong
	starting_vol = 15

/obj/item/reagent_containers/glass/bottle/carpotoxin
	name = "carpotoxin bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/carpotoxin/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/carpotoxin, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/spider_venom
	name = "spider venom bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/spider_venom/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/venom, 60)
	update_icon()

// Disease-engineering reagents
/obj/item/reagent_containers/glass/bottle/virus_food
	name = "virus food bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/virus_food/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/virus_food, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/mutagen_virus_food
	name = "mutagenic agar bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/mutagen_virus_food/New()
	..()
	reagents.add_reagent(/datum/reagent/unstable_mutagen/mutagen_virus_food, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/phoron_virus_food
	name = "virus phoron bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/phoron_virus_food/New()
	..()
	reagents.add_reagent(/datum/reagent/toxin/phoron/phoron_virus_food, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/synaptizine_virus_food
	name = "virus rations bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/synaptizine_virus_food/New()
	..()
	reagents.add_reagent(/datum/reagent/medicine/stimulant/synaptizine/synaptizine_virus_food, 60)
	update_icon()

/obj/item/reagent_containers/glass/bottle/uranium_virus_food
	name = "uranium virus food bottle"
	icon_state = "bottle-1"

/obj/item/reagent_containers/glass/bottle/uranium_virus_food/New()
	..()
	reagents.add_reagent(/datum/reagent/uranium/uranium_virus_food, 60)
	update_icon()

// Bottles with diseases
/obj/item/reagent_containers/glass/bottle/virus_flu
	icon_state = "bottle-3"
	spawned_disease = /datum/disease/advance/flu

/obj/item/reagent_containers/glass/bottle/virus_cold
	icon_state = "bottle-3"
	spawned_disease = /datum/disease/advance/cold

// Random ones
/obj/item/reagent_containers/glass/bottle/virus_random
	spawned_disease = /datum/disease/advance/random
	var/max_symptoms = 3
	var/max_severity = 2

/obj/item/reagent_containers/glass/bottle/virus_random/SpawnDisease()
	return new spawned_disease(max_symptoms, max_severity)

/obj/item/reagent_containers/glass/bottle/virus_random/medium
	max_severity = 6

/obj/item/reagent_containers/glass/bottle/virus_random/high
	max_severity = 12

/obj/item/reagent_containers/glass/bottle/rage
	spawned_disease = /datum/disease/rage
