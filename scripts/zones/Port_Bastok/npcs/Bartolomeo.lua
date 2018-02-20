-----------------------------------
-- Area: Port Bastok
--  NPC: Bartolomeo
-- Standard Info NPC
-- Involved in Quest: Welcome to Bastok
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

  local WelcometoBastok = player:getQuestStatus(BASTOK,WELCOME_TO_BASTOK);

  if (WelcometoBastok == QUEST_ACCEPTED and player:getVar("WelcometoBastok_Event") ~= 1 and player:getEquipID(SLOT_SUB) == 12415) then -- Shell Shield
    player:startEvent(52);
  else
    player:messageSpecial(BARTHOLOMEO_DIALOG);
  end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 52 and player:getQuestStatus(BASTOK,WELCOME_TO_BASTOK) == QUEST_ACCEPTED) then
        player:setVar("WelcometoBastok_Event",1)
    end

end;