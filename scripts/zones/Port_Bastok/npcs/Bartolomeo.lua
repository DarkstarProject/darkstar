-----------------------------------
-- Area: Port Bastok
-- NPC: Bartolomeo
-- Standard Info NPC
-- Involved in Quest: Welcome to Bastok
-----------------------------------

require("scripts/globals/keyitems");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

  WelcometoBastok = player:getQuestStatus(BASTOK,WELCOME_TO_BASTOK);
  questStatus = player:getVar("WelcometoBastok_Event");
  itemEquipped = player:getEquipID(1);

  if (WelcometoBastok == 1 and questStatus ~= 1 and itemEquipped == SHELL_SHIELD) then
    player:startEvent(0x0034);
  else
  	player:startEvent(0x008c);
  end	

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

    if (csid == 0x34 and WelcometoBastok == 1) then
        player:setVar("WelcometoBastok_Event",1)
    end
end;




