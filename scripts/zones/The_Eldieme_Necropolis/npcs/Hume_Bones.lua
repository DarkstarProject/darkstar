-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Hume Bones
-- Involved in Quests: Blue Ribbon Blues
-- !pos 299 0.1 19 195
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    if (
        player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED and
        player:getVar("BlueRibbonBluesProg") >= 3 and
        trade:hasItemQty(13569,1) and trade:getItemCount() == 1 and
        player:getVar("Lich_C_Magnus_Died") == 0 and
        not GetMobByID(ID.mob.LICH_C_MAGNUS):isSpawned()
    ) then
        player:messageSpecial(ID.text.RETURN_RIBBON_TO_HER);
        player:tradeComplete();
        SpawnMob(ID.mob.LICH_C_MAGNUS):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("Lich_C_Magnus_Died") == 1 and not player:hasItem(12521)) then
        if (player:getFreeSlotsCount() >= 1) then
            player:addItem(12521);
            player:messageSpecial(ID.text.ITEM_OBTAINED,12521);
            player:setVar("Lich_C_Magnus_Died",0);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,12521);
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
