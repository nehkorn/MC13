/datum/spell/targeted/glimpse_of_eternity
	name = "Glimpse of Eternity"
	desc = "Show the non-believers what enlightenment truely means."
	invocation = "Ghe Tar Yet!"
	invocation_type = INVOKE_SHOUT
	spell_flags = INCLUDEUSER
	max_targets = 0
	charge_max = 400
	range = 3

	hud_state = "wiz_glimpse"

	spell_cost = 2
	mana_cost = 10

/datum/spell/targeted/glimpse_of_eternity/cast(var/list/targets, var/mob/user)
	for(var/t in targets)
		var/mob/living/L = t
		if(L.faction != user.faction) //Worse for non-allies
			L.eye_blind += 5
			L.Stun(5)
			new /obj/effect/temp_visual/temporary(get_turf(L), 5, 'icons/effects/effects.dmi', "electricity_constant")
		else
			L.eye_blind += 2
			L.adjustBruteLoss(-10)
			L.adjustFireLoss(-10)
			new /obj/effect/temp_visual/temporary(get_turf(L), 5, 'icons/effects/effects.dmi', "green_sparkles")
