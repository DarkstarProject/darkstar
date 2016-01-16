-----------------------------------
--    Area: Inner Horutoto Ruins
--    NPC:  Sealed Portal
--  Involved in Quest: Making the Grade
--    Working 50%
--  Notes: Door will open if player has Making the Grade quest active, or if the have the KI portal charm. Door should open when 3 mages stand on circles, but no API for this yet.
--  @pos -259 -1 -20 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 ---- WHM BLM RDM CIRCLE LOCATIONS FOR WHEM API IS AVAILABLE TO QUERY POSITIONS IN ZONE EVERY 3 SECONDS --
 -- if ((whmzpos >= -26 and whmzpos <= -22) and (whmxpos <= -261 and whmxpos >= -265))
 -- if ((blmzpos >= -26 and blmzpos <= -22) and (blmxpos <= -254 and blmxpos >= -258))
 -- if ((rdmzpos >= -31 and rdmzpos <= -27) and (rdmxpos <= -257 and rdmxpos >= -261))
 ----------------------------------------------------------------------------------------------------------
    
    if (player:getZPos() >= -15) then
        player:messageSpecial(PORTAL_NOT_OPEN_THAT_SIDE);
    else
        if (player:hasKeyItem(PORTAL_CHARM)) then
            npc:openDoor(30);
        elseif (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
            -- quest not scripted ?
        else
            player:messageSpecial(PORTAL_SEALED_BY_3_MAGIC)
        end
    end
    
    return 1;
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;