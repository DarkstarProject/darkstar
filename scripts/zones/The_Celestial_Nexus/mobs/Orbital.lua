-----------------------------------
-- Area: The Celestial Nexus
--  NPC: Orbital
-- Zilart Mission 16 BCNM Fight
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 50);
end;

function onMobSpawn(mob)
end;

function onMobFight(mob, target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onEventUpdate(player,csid,option)
    -- printf("updateCSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,target)
    -- printf("finishCSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 32004) then
        if (GetMobByID(target:getID()-1):getName() == "Orbital") then
            DespawnMob(target:getID());
            DespawnMob(target:getID()-1);
            DespawnMob(target:getID()-3);
            DespawnMob(target:getID()-4);
            mob = SpawnMob(target:getID()-2);
            mob:updateEnmity(player);
            --the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
            mob:addStatusEffectEx(dsp.effects.BIND, 0, 1, 0, 30);
            mob:addStatusEffectEx(dsp.effects.SILENCE, 0, 1, 0, 40);
        else
            DespawnMob(target:getID());
            DespawnMob(target:getID()+1);
            DespawnMob(target:getID()-2);
            DespawnMob(target:getID()-3);
            mob = SpawnMob(target:getID()-1);
            mob:updateEnmity(player);
            -- the "30 seconds of rest" you get before he attacks you, and making sure he teleports first in range
            mob:addStatusEffectEx(dsp.effects.BIND, 0, 1, 0, 30);
            mob:addStatusEffectEx(dsp.effects.SILENCE, 0, 1, 0, 40);
        end
    end

end;