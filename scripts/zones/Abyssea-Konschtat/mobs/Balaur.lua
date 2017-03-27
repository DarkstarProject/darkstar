-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Balaur
-----------------------------------
package.loaded["scripts/zones/Abyssea-Konschtat/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Konschtat/TextIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
    -- Uncertain of threshold. Going with 50% for now.
    -- (possibly varies, perhaps is simply lower HP = greater cast chance?)
    if (mob:getHPP() <=50) then
        mob:setMobMod(MOBMOD_SKILL_LIST, 790);
    else
        -- I'm assuming that if it heals up, it goes back to the other spell list.
        mob:setMobMod(MOBMOD_SKILL_LIST, 791);
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local KI_CHANCE = 40;
    local SPELL_CHANCE = 40;

    if (math.random(0,99) < KI_CHANCE and player:hasKeyItem(ATMA_OF_STORMBREATH) == false) then
        player:addKeyItem(ATMA_OF_STORMBREATH);
        player:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_STORMBREATH);
    end

    if (math.random(0,99) < SPELL_CHANCE and player:getMainJob() == JOBS.BLU and player:hasSpell(695) == false) then
        player:addSpell(695);
    end
end;