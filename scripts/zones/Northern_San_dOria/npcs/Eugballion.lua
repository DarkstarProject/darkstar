-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Eugballion
-- Only sells when San d'Oria controlls Qufim Region
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
local text = require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    -- "Flyers for Regine" conditional script
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
            player:messageSpecial(text.FLYER_REFUSED);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (GetRegionOwner(QUFIMISLAND) ~= SANDORIA) then 
        player:showText(npc, text.EUGBALLION_CLOSED_DIALOG);
    else
        player:showText(npc, text.EUGBALLION_OPEN_DIALOG);
        
        stock = {0x03ba,4121}        -- Magic Pot Shard
                  
        showShop(player,SANDORIA,stock);
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