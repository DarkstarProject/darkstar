-----------------------------------
-- Area: 
-- NPC:  Ultima
-----------------------------------
-----------------------------------

require("scripts/globals/titles");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
	mob:addStatusEffect(EFFECT_REGEN,1,3,0);

end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	killer:addTitle(ULTIMA_UNDERTAKER);	

end;