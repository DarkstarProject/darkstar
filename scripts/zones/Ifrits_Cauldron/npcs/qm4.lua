-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  ???
-- Involved in Mission: Bastok 6-2
-- @pos 171 0 -25 205
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Ifrits_Cauldron/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getCurrentMission(BASTOK) == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 2) then
        if (GetMobAction(17616897) == 0 and GetMobAction(17616898) == 0 and trade:hasItemQty(646,1) and trade:getItemCount() == 1) then
            player:tradeComplete();
            SpawnMob(17616897):updateClaim(player);
            SpawnMob(17616898):updateClaim(player);
            npc:setStatus(STATUS_DISAPPEAR);
        end
    end    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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