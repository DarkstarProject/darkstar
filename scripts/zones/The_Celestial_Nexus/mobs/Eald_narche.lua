-----------------------------------
-- Area: The Celestial Nexus
-- NPC:  Eald'Narche - Phase 1
-- Zilart Mission 16 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

function onMobInitialize(mob)
    --50% fast cast
    mob:addMod(MOD_UFASTCAST, 50);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:SetAutoAttackEnabled(false);
    mob:setMobMod(MOBMOD_STANDBACK_TIME, 0);
    mob:setMobMod(MOBMOD_GA_CHANCE,25);
    mob:addStatusEffectEx(EFFECT_PHYSICAL_SHIELD, 0, 1, 0, 0);
    mob:addStatusEffectEx(EFFECT_ARROW_SHIELD, 0, 1, 0, 0);
    mob:addStatusEffectEx(EFFECT_MAGIC_SHIELD, 0, 1, 0, 0);
end;

function onMobEngaged(mob, target)
    mob:addStatusEffectEx(EFFECT_SILENCE, 0, 1, 0, 5);
    GetMobByID(mob:getID() + 1):updateEnmity(target);
end;

function onMobFight(mob, target)
    if (mob:getBattleTime() % 9 <= 2) then
        local orbital1 = mob:getID()+3;
        local orbital2 = mob:getID()+4;
        
        if (GetMobAction(orbital1) == ACTION_NONE) then
            GetMobByID(orbital1):setPos(mob:getPos());
            SpawnMob(orbital1):updateEnmity(target);
        elseif (GetMobAction(orbital2) == ACTION_NONE) then
            GetMobByID(orbital2):setPos(mob:getPos());
            SpawnMob(orbital2):updateEnmity(target);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    DespawnMob(mob:getID()+1);
    DespawnMob(mob:getID()+3);
    DespawnMob(mob:getID()+4);
    local battlefield = killer:getBattlefield();
    killer:startEvent(0x7d04, battlefield:getBattlefieldNumber());
end;


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("updateCSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
--printf("finishCSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x7d04) then
        DespawnMob(target:getID());
		mob = SpawnMob(target:getID()+2);
		mob:updateEnmity(player);
        --the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
        mob:addStatusEffectEx(EFFECT_BIND, 0, 1, 0, 30);
        mob:addStatusEffectEx(EFFECT_SILENCE, 0, 1, 0, 40);
	end

end;