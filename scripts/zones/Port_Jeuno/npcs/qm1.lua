-----------------------------------
-- Area: Port Jeuno
--  NPC: ???
-- Finish Quest: Borghertz's Hands (AF Hands, Many job)
-- !pos -51 8 -4 246
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    OldGauntlets = player:hasKeyItem(dsp.ki.OLD_GAUNTLETS);
    ShadowFlames = player:hasKeyItem(dsp.ki.SHADOW_FLAMES);
    BorghertzCS = player:getVar("BorghertzCS");

    if (OldGauntlets == true and ShadowFlames == false and BorghertzCS == 1) then
        player:startEvent(20);
    elseif (OldGauntlets == true and ShadowFlames == false and BorghertzCS == 2) then
        player:startEvent(49);
    elseif (OldGauntlets == true and ShadowFlames == true) then
        player:startEvent(48);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 20 and option == 1) then
        player:setVar("BorghertzCS",2);
    elseif (csid == 48) then
        NumQuest = dsp.quest.id.jeuno.BORGHERTZ_S_WARRING_HANDS + player:getVar("BorghertzAlreadyActiveWithJob") - 1;
        NumHands = 13960 + player:getVar("BorghertzAlreadyActiveWithJob");
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,NumHands);
        else
            player:addItem(NumHands);
            player:messageSpecial(ID.text.ITEM_OBTAINED,NumHands);
            player:delKeyItem(dsp.ki.OLD_GAUNTLETS);
            player:delKeyItem(dsp.ki.SHADOW_FLAMES);
            player:setVar("BorghertzCS",0);
            player:setVar("BorghertzAlreadyActiveWithJob",0);
            player:addFame(JEUNO,30);
            player:completeQuest(JEUNO,NumQuest);
        end
    end
end;