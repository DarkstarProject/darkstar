-----------------------------------
-- Area:  Dynamis San d'Oria
--  NPC:  qm1 (???)
-- Notes: Spawns when Megaboss is defeated
-----------------------------------

require("scripts/globals/keyitems");
local text = require("scripts/zones/Dynamis-San_dOria/TextIDs");

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
        player:messageSpecial(text.KEYITEM_OBTAINED,HYDRA_CORPS_COMMAND_SCEPTER);
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