-----------------------------------
-- Area: Vunkerl Inlet (S) (H-6)
--  NPC: ???
-- Involved in Quests
-- !pos -26 -31 364
-----------------------------------
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.BOY_AND_THE_BEAST) == QUEST_AVAILABLE and player:getVar("BoyAndTheBeast") == 2) then
        player:startEvent(105);
    elseif (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getVar("BoyAndTheBeast") == 3) then
        player:startEvent(108);
    elseif (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getVar("BoyAndTheBeast") == 4) then
        player:startEvent(109);
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 105) then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.BOY_AND_THE_BEAST);
        player:addKeyItem(dsp.ki.VUNKERL_HERB_MEMO);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.VUNKERL_HERB_MEMO);
    elseif (csid == 108) then
        if(player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,17384); -- Carbon Fishing Rod
        else
            player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.BOY_AND_THE_BEAST);
            player:delKeyItem(dsp.ki.VUNKERL_HERB_MEMO);
            player:delKeyItem(dsp.ki.VUNKERL_HERB);
            player:addItem(17384);
            player:messageSpecial(ID.text.ITEM_OBTAINED,17384); --Carbon Fishing Rod
        end
    elseif (csid == 109) then
        player:delKeyItem(dsp.ki.VUNKERL_HERB);
        player:setVar("BoyAndTheBeast",2);
    end
end;
