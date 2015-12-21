-----------------------------------
-- Area:  Dynamis Bastok
-- NPC:   qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------
package.loaded["scripts/zones/Dynamis-Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Bastok/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasKeyItem(HYDRA_CORPS_EYEGLASS) == false) then
        player:setVar("DynaBastok_Win",1);
        player:addKeyItem(HYDRA_CORPS_EYEGLASS);
        player:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_EYEGLASS);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);        
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
end;