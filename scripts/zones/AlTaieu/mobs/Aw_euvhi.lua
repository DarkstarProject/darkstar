-----------------------------------
-- Area: AlTaieu
--  MOB: Aw_euvhi
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    -- This should have just been 3 mob names with 3 scripts because ID shifts (and sanity)..
    if (mobID == 16912823 or mobID == 16912825 or mobID == 16912827) then
        if (player:hasKeyItem(BLACK_CARD) == false) then
            player:addKeyItem(BLACK_CARD);
            player:messageSpecial(KEYITEM_OBTAINED,BLACK_CARD);
        end
    elseif (mobID == 16912811 or mobID == 16912813 or mobID == 16912815) then
        if (player:hasKeyItem(WHITE_CARD) == false) then
            player:addKeyItem(WHITE_CARD);
            player:messageSpecial(KEYITEM_OBTAINED,WHITE_CARD);
        end
    elseif (mobID == 16912817 or mobID == 16912821 or mobID == 16912819) then
        if (player:hasKeyItem(RED_CARD) == false) then
            player:addKeyItem(RED_CARD);
            player:messageSpecial(KEYITEM_OBTAINED,RED_CARD);
        end
    end
end;