-----------------------------------
-- Area: The Celestial Nexus
--  NPC: Orbital
-- Zilart Mission 16 BCNM Fight
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 50);
end

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("updateCSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option,target)
    -- printf("finishCSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x7d04) then
        if (GetMobByID(target:getID()-1):getName() == "Orbital") then
            DespawnMob(target:getID());
            DespawnMob(target:getID()-1);
            DespawnMob(target:getID()-3);
            DespawnMob(target:getID()-4);
            mob = SpawnMob(target:getID()-2);
            mob:updateEnmity(player);
            --the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
            mob:addStatusEffectEx(EFFECT_BIND, 0, 1, 0, 30);
            mob:addStatusEffectEx(EFFECT_SILENCE, 0, 1, 0, 40);
        else
            DespawnMob(target:getID());
            DespawnMob(target:getID()+1);
            DespawnMob(target:getID()-2);
            DespawnMob(target:getID()-3);
            mob = SpawnMob(target:getID()-1);
            mob:updateEnmity(player);
            -- the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
            mob:addStatusEffectEx(EFFECT_BIND, 0, 1, 0, 30);
            mob:addStatusEffectEx(EFFECT_SILENCE, 0, 1, 0, 40);
        end
    end

end;