-----------------------------------
-- Area: Quicksand Caves
-- NPC:  ???
-- Involved in Mission: The Mithra and the Crystal (Zilart 12)
-- @pos -504 20 -419 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Quicksand_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(ZILART) == THE_MITHRA_AND_THE_CRYSTAL and player:getVar("ZilartStatus") == 1 and player:hasKeyItem(SCRAP_OF_PAPYRUS) == false) then
        if (player:needToZone() and player:getVar("AncientVesselKilled") == 1) then
            player:setVar("AncientVesselKilled",0);
            player:addKeyItem(SCRAP_OF_PAPYRUS);
            player:messageSpecial(KEYITEM_OBTAINED,SCRAP_OF_PAPYRUS);
        else
            player:startEvent(0x000c);
        end
    elseif (player:hasCompletedMission(ZILART,THE_MITHRA_AND_THE_CRYSTAL) or player:hasKeyItem(SCRAP_OF_PAPYRUS)) then
        player:messageSpecial(YOU_FIND_NOTHING);
    else
        player:messageSpecial(SOMETHING_IS_BURIED);
    end
    
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
    
    if (csid == 0x000c and option == 1) then
        SpawnMob(17629642,600):updateClaim(player); -- Ancient Vessel
    end
    
end;