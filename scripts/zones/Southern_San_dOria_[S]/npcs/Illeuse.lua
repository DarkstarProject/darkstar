-----------------------------------
-- Area: Southern SandOria [S]
-- NPC: Illeuse
-- @zone 80
-- @pos -44.203 2 -36.216
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria_[S]/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria_[S]/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(CRYSTAL_WAR,GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getVar("GiftsOfGriffonProg") == 2) then
        local mask = player:getVar("GiftsOfGriffonPlumes");
        if (trade:hasItemQty(2528,1) and trade:getItemCount() == 1 and not player:getMaskBit(mask,2)) then
            player:startEvent(0x01F) -- Gifts of Griffon Trade
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x0269); -- Default Dialogue
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
    if (csid == 0x01F) then -- Gifts of Griffon Trade
        player:tradeComplete();
        local mask = player:getVar("GiftsOfGriffonPlumes");
        player:setMaskBit(mask,"GiftsOfGriffonPlumes",2,true);
    end    
end;