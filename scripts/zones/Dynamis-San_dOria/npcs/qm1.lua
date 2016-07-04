-----------------------------------
-- Area:  Dynamis San d'Oria
-- NPC:   qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------
package.loaded["scripts/zones/Dynamis-San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-San_dOria/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasKeyItem(HYDRA_CORPS_COMMAND_SCEPTER) == false) then
        player:setVar("DynaSandoria_Win",1);
        player:addKeyItem(HYDRA_CORPS_COMMAND_SCEPTER);
        player:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_COMMAND_SCEPTER);
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