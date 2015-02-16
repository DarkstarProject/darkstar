-----------------------------------
-- Area: Horlais Peak
-- NPC:  Maat
-- Genkai 5 Fight
-----------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Horlais_Peak/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
	if (target:hasStatusEffect(EFFECT_FOOD) == true and mob:hasStatusEffect(EFFECT_FOOD) == false) then
		local FOOD_ID = target:getStatusEffect(EFFECT_FOOD):getSubType();
		mob:SpoofChatParty("eats the same food you did!", MESSAGE_EMOTION);
		mob:addStatusEffect(EFFECT_FOOD,0,0,600,FOOD_ID);
		mob:SpoofChatParty("Maat gains the effect of OH-SNAP!", MESSAGE_ECHO);
	end
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function OnMobEngaged(mob,target)
	target:showText(mob,YOU_DECIDED_TO_SHOW_UP);
	printf("Maat Horlais Peak works");
	-- When he take damage: target:showText(mob,THAT_LL_HURT_IN_THE_MORNING);
	-- He use dragon kick or tackle: target:showText(mob,TAKE_THAT_YOU_WHIPPERSNAPPER);
	-- He use spining attack: target:showText(mob,TEACH_YOU_TO_RESPECT_ELDERS);
	-- If you dying: target:showText(mob,LOOKS_LIKE_YOU_WERENT_READY);
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
	killer:showText(mob,YOUVE_COME_A_LONG_WAY);
end;