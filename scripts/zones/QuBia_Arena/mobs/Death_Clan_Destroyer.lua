-----------------------------------
-- Area: QuBia_Arena
--  MOB: Death Clan Destroyer
-----------------------------------
require("scripts/zones/QuBia_Arena/MobIDs");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_HP_STANDBACK, 60);
end;

function onMobFight(mob,target)
    local inst = mob:getBattlefield():getBattlefieldNumber();
    mob:setMP(9999);

    for i,v in ipairs(HEIR_TO_THE_LIGHT_MOBLIST[inst]) do
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
    -- if all mobs in list are dead, victory
    local inst = player:getBattlefield():getBattlefieldNumber();
    for i,v in ipairs(HEIR_TO_THE_LIGHT_MOBLIST[inst]) do
        if (not GetMobByID(v):isDead()) then
            return;
        end
    end
    player:startEvent(32004,0,0,4);
end;
