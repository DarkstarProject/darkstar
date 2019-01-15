-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Guilberdrier
-- Type: Standard Info NPC
--  Involved in Quest: Flyers for Regine, Exit the Gambler
-- !pos -159.082 12.000 253.794 231
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeGuilberdrier") == 0) then
            player:messageSpecial(ID.text.CAPIRIA_DIALOG); -- gave this NPC a generic response to flyer. I don't see a unique one in the extract. need retail capture.
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeGuilberdrier",1);
            player:messageSpecial(ID.text.FLYER_ACCEPTED);
            player:tradeComplete();
        elseif (player:getVar("tradeGuilberdrier") ==1) then
            player:messageSpecial(ID.text.FLYER_ALREADY);
        end
    end
end;

function onTrigger(player,npc)
    if player:getVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_GUILBERDRIER)
    else
        player:startEvent(522);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
