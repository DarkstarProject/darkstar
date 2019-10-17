----------------------------------
-- Area: Ifrit's Cauldron
--  NPC: Altar of Ashes
-- Involved in Quest: Greetings to the Guardian
-- !pos 16 .1 -58 205
-----------------------------------
local ID = require("scripts/zones/Ifrits_Cauldron/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    local Guardian = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN);

    if (Guardian == QUEST_ACCEPTED and trade:hasItemQty(4596,1)) then
        player:messageSpecial(ID.text.ALTAR_OFFERING,0,4596);
        player:setCharVar("PamamaVar",1); --Set variable to reflect first completion of quest
        player:tradeComplete();
    elseif (Guardian == QUEST_COMPLETED and trade:hasItemQty(4596,1)) then
        player:messageSpecial(ID.text.ALTAR_OFFERING,0,4596);
        player:setCharVar("PamamaVar",2); --Set variable to reflect repeat of quest, not first time
        player:tradeComplete();
    end
end;

function onTrigger(player,npc)
    local Guardian = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.GREETINGS_TO_THE_GUARDIAN);

    if (Guardian == QUEST_ACCEPTED and player:getCharVar("PamamaVar") == 1 or player:getCharVar("PamamaVar") == 2) then
        player:messageSpecial(ID.text.ALTAR_COMPLETED);
    elseif (Guardian == QUEST_ACCEPTED and player:getCharVar("PamamaVar") == 0) then
        player:messageSpecial(ID.text.ALTAR_INSPECT);
    else
        player:messageSpecial(ID.text.ALTAR_STANDARD);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
