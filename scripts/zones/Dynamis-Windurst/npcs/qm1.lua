-----------------------------------
-- Area: Dynamis Windurst
--  NPC: qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------

require("scripts/globals/keyitems");
local text = require("scripts/zones/Dynamis-Windurst/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
    
    if (player:hasKeyItem(HYDRA_CORPS_LANTERN) == false) then
        player:setVar("DynaWindurst_Win",1);
        player:addKeyItem(HYDRA_CORPS_LANTERN);
        player:messageSpecial(text.KEYITEM_OBTAINED,HYDRA_CORPS_LANTERN);
    else
        player:messageSpecial(text.NOTHING_OUT_OF_ORDINARY);        
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