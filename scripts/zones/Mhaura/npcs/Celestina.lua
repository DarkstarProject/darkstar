-----------------------------------
-- Area: Mhaura
--  NPC: Celestina
-- Finish Quest: The Sand Charm
-- Involved in Quest: Riding on the Clouds
-- Guild Merchant NPC: Goldsmithing Guild
-- !pos -37.624 -16.050 75.681 249
-----------------------------------
local ID = require("scripts/zones/Mhaura/IDs");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.THE_SAND_CHARM) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(13095,1) and trade:getItemCount() == 1) then
            player:startEvent(127); -- Finish quest "The Sand Charm"
        end
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_3") == 5) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_3",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SOMBER_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SOMBER_STONE);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getVar("theSandCharmVar") == 3) then
        player:startEvent(126,13095); -- During quest "The Sand Charm" - 3rd dialog
    elseif (player:sendGuild(528,8,23,4)) then
        player:showText(npc,ID.text.GOLDSMITHING_GUILD);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 126 and option == 70) then
        player:setVar("theSandCharmVar",4);
    elseif (csid == 127) then
        player:tradeComplete();
        player:setVar("theSandCharmVar",0);
        player:setVar("SmallDialogByBlandine",1);
        player:addKeyItem(dsp.ki.MAP_OF_BOSTAUNIEUX_OUBLIETTE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAP_OF_BOSTAUNIEUX_OUBLIETTE);
        player:addFame(MHAURA,30);
        player:completeQuest(OTHER_AREAS_LOG,dsp.quest.id.otherAreas.THE_SAND_CHARM);
    end

end;