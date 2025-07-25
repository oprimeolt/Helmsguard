/mob/living/simple_animal/hostile/retaliate/rogue/halftroll
	icon = 'modular_hearthstone/icons/mob/Trolls.dmi'
	name = "half troll"
	desc = "An abomination of a troll, this half troll is a twisted mockery of the original. It is smaller and weaker than a full troll."
	icon_state = "bogtroll"
	icon_living = "bogtroll"
	icon_dead = "bogtroll_dead"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 1
	see_in_dark = 10
	move_to_delay = 3
	base_intents = list(/datum/intent/unarmed/punch)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 15,
						/obj/item/natural/hide = 15, /obj/item/natural/bundle/bone/full = 3, /obj/item/natural/halftroll_head = 1)
	faction = list("trolls")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 150
	maxHealth = 200
	melee_damage_lower = 45
	melee_damage_upper = 70
	vision_range = 2
	aggro_vision_range = 3
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null
	STACON = 18
	STASTR = 15
	STASPD = 3
	deaggroprob = 0
	defprob = 40
	del_on_deaggro = 44 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	dodgetime = 0
	aggressive = 1
//	stat_attack = UNCONSCIOUS

/mob/living/simple_animal/hostile/retaliate/rogue/halftroll/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/halftroll/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/halftroll/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/halftroll/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/troll/trollaggro1.ogg')
		if("death")
			return pick('sound/vo/mobs/troll/trolldeath.ogg')
		if("idle")
			return pick('sound/vo/mobs/troll/trollidle1.ogg', 'sound/vo/mobs/troll/trollidle2.ogg')


/mob/living/simple_animal/hostile/retaliate/rogue/halftroll/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

/obj/item/natural/halftroll_head
	icon = 'icons/roguetown/mob/monster/Trolls.dmi'
	name = "half troll's head"
	icon_state = "bogtroll_head"
	desc = "The hideous dismembered head of a half troll."
	dropshrink = null
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	sellprice = 80
