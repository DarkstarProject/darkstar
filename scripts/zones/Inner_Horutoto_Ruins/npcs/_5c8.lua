-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: Sealed Portal
-- Involved in Quest: Making the Grade
-- Door should open when Whm+Blm+Rdm stand in correct regions (see \Inner_Horutoto_Ruins\zone.lua),
-- or if player has the KeyItem "portal charm".
-- !pos -259 -1 -20 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getZPos() >= -15) then
        player:messageSpecial(PORTAL_NOT_OPEN_THAT_SIDE);
    else
        if (player:hasKeyItem(PORTAL_CHARM)) then
            npc:openDoor(30);
        else
            player:messageSpecial(PORTAL_SEALED_BY_3_MAGIC)
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
