-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Hume Bones
-- Involved in Quests: Blue Ribbon Blues
-- !pos 299 0.1 19 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/zones/The_Eldieme_Necropolis/MobIDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    if (
        player:getQuestStatus(WINDURST,BLUE_RIBBON_BLUES) == QUEST_ACCEPTED and
        player:getVar("BlueRibbonBluesProg") >= 3 and
        trade:hasItemQty(13569,1) and trade:getItemCount() == 1 and
        player:getVar("Lich_C_Magnus_Died") == 0 and
        not GetMobByID(LICH_C_MAGNUS):isSpawned()
    ) then
        player:messageSpecial(RETURN_RIBBON_TO_HER);
        player:tradeComplete();
        SpawnMob(LICH_C_MAGNUS):updateClaim(player);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("Lich_C_Magnus_Died") == 1 and not player:hasItem(12521)) then
        if (player:getFreeSlotsCount() >= 1) then
            player:addItem(12521);
            player:messageSpecial(ITEM_OBTAINED,12521);
            player:setVar("Lich_C_Magnus_Died",0);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12521);
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
