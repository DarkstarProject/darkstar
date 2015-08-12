-----------------------------------
-- Area: Misareaux Coast
-- NPC:  Gration
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	mob:addStatusEffect(EFFECT_KILLER_INSTINCT,40,0,0);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	GetNPCByID(16879940):hideNPC(900);
	local kills = killer:getVar("FOMOR_HATE");
	if (kills > 1) then
		killer:setVar("FOMOR_HATE",kills -2);
	end
end;