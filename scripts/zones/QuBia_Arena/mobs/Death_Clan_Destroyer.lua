-----------------------------------
-- Area: QuBia_Arena
--  MOB: Death Clan Destroyer
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/QuBia_Arena/TextIDs");
require("scripts/zones/QuBia_Arena/MobIDs");
require("scripts/globals/missions");
require("scripts/globals/status");
require("scripts/globals/titles");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_HP_STANDBACK, 60);
end;

function onMobSpawn(mob)
end;

function onMobFight(mob,target)
    local inst = mob:getBattlefield():getBattlefieldNumber();
    mob:setMP(9999);

    for i,v in ipairs(MOBLIST[inst]) do
    -- printf("MP %u",mob:getMP());
        if (GetMobAction(v) == 27) then
            if (mob:actionQueueEmpty() == true) then
                if (mob:getLocalVar("cooldown") == 0) then
                    mob:castSpell(8,GetMobByID(v));
                    mob:setLocalVar("cooldown",20);
                end
            elseif (mob:actionQueueEmpty() == false) then
                mob:setLocalVar("cooldown",20);
            end
        end
    end

    if (mob:getLocalVar("cooldown") > 0) then
        mob:setLocalVar("cooldown",mob:getLocalVar("cooldown")-1);
    end

    -- printf("cooldown %u",mob:getLocalVar("cooldown"));
end;

function onMobDeath(mob, player, isKiller)
    local inst = player:getBattlefield():getBattlefieldNumber();
    local victory = true
    for i,v in ipairs(MOBLIST[inst]) do
        if (not GetMobByID(v):isDead()) then
            victory = false
        end
    end

    if (victory == true) then
        player:startEvent(32004,0,0,4);
    end
end;
