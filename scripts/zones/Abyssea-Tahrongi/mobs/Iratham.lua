-----------------------------------
-- Area: Abyssea - Tahrongi
--  Mob: Iratham
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob,target)
    if (mob:getHPP() < 20) then
        mob:setMobMod(MOBMOD_SPELL_LIST, 155);
    elseif (mob:getHPP() < 50) then
        mob:setMobMod(MOBMOD_SPELL_LIST, 154);
    else
        -- I'm assuming that if it heals up, it goes back to the its original spell list.
        mob:setMobMod(MOBMOD_SPELL_LIST, 153);
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(IRATHAM_CAPTURER);
end;
