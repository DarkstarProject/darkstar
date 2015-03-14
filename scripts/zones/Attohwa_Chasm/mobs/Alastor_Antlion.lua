-----------------------------------
-- Area: Attohwa Chasm
-- NPC:  Alastor Antlion
-- ID: 	
-----------------------------------
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
	mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
	mob:setTP(100);
	mob:setMobMod(MOBMOD_GA_CHANCE,50);
	mob:setMobMod(MOBMOD_MUG_GIL,10000);
	mob:addMod(MOD_FASTCAST,10);
	mob:addMod(MOD_BINDRES,40);
	mob:addMod(MOD_SILENCERES,40);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------
function onMobEngaged(mob, killer)
	mob:useMobAbility(22); -- Pit Ambush
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

function onAdditionalEffect(mob, player)
    local chance = 25;
	local resist = player:getMod(MOD_PETRIFYRES);
    local duration = 30; -- Don't know the actual duration.
	if (resist>0) then
		duration=duration-duration*(resist/20);
	end
	
	if(math.random(1,99)>=(chance-resist/5)) then
        return 0,0,0;
    else
        if (not player:hasStatusEffect(EFFECT_PETRIFICATION)) then
            player:addStatusEffect(EFFECT_PETRIFICATION, 1, 0, duration);
        end
        return SUBEFFECT_PETRIFY, 160, EFFECT_PETRIFICATION;
    end
end;