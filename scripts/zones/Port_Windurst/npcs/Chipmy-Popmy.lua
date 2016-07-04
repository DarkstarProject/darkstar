-----------------------------------
--    Area: Port Windurst
--    NPC: Chipmy-Popmy
--    Working 100%
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local currentday = tonumber(os.date("%j")); 
   if (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus")==3 and player:getVar("Promathia_kill_day") ~= currentday and player:getVar("COP_3-taru_story")== 0 ) then
    player:startEvent(0x026B);
   else
    player:startEvent(0xca);
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
  if (csid == 0x026B) then
     player:setVar("COP_3-taru_story",1);
  end
end;



