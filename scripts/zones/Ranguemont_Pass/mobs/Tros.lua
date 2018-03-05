-----------------------------------
-- Area: Ranguemont Pass
--  NM:  Tros
-- Used in Quests: Painful Memory
-- !pos -289 -45 212 166
-----------------------------------
require("scripts/globals/keyitems");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:hasKeyItem(MERTAIRES_BRACELET)) then
        player:setVar("TrosKilled",1);
        player:setVar("Tros_Timer",os.time());
    end
end;
