-----------------------------------
-- Area: Port Bastok
--  NPC: Bartolomeo
-- Standard Info NPC
-- Involved in Quest: Welcome to Bastok
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Port_Bastok/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WelcometoBastok = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.WELCOME_TO_BASTOK);

    if (WelcometoBastok == QUEST_ACCEPTED and player:getVar("WelcometoBastok_Event") ~= 1 and player:getEquipID(dsp.slot.SUB) == 12415) then -- Shell Shield
        player:startEvent(52);
    else
        player:messageSpecial(ID.text.BARTHOLOMEO_DIALOG);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 52 and player:getQuestStatus(BASTOK,dsp.quest.id.bastok.WELCOME_TO_BASTOK) == QUEST_ACCEPTED) then
        player:setVar("WelcometoBastok_Event",1)
    end

end;