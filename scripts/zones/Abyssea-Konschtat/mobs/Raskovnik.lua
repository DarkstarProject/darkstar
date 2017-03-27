-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Raskovnik
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
        mob:setMobMod(MOBMOD_SKILL_LIST, 805);
    else
        -- I'm assuming that if it heals up, it goes back to the other spell list.
        mob:setMobMod(MOBMOD_SKILL_LIST, 806);
        -- This 'else' can be removed if that isn't the case, and a localVar added so it only execs once.
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local KI_CHANCE = 60;
    local ATMA_CHANCE = 30;

    if (KI_CHANCE > math.random(0,99) and player:hasKeyItem(FETID_RAFFLESIA_STALK) == false) then
        player:addKeyItem(FETID_RAFFLESIA_STALK);
        player:messageSpecial(KEYITEM_OBTAINED, FETID_RAFFLESIA_STALK);
    end

    if (ATMA_CHANCE > math.random(0,99) and player:hasKeyItem(ATMA_OF_THRASHING_TENDRILS) == false) then
        player:addKeyItem(ATMA_OF_THRASHING_TENDRILS);
        player:messageSpecial(KEYITEM_OBTAINED, ATMA_OF_THRASHING_TENDRILS);
    end
end;