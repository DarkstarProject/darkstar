-----------------------------------
-- Area: Appolyon
-- NPC:  Sentinel_Column
-- @pos 
-----------------------------------
require("scripts/globals/limbus");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

   player:startEvent(0x00DD,127);
 
  
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
  -- printf("CSID: %u",csid);
   --printf("RESULT: %u",option);  
 player:updateEvent(0,player:getSpecialBattlefieldLeftTime(2),player:getSpecialBattlefieldLeftTime(1),player:getSpecialBattlefieldLeftTime(4),player:getSpecialBattlefieldLeftTime(3),player:getSpecialBattlefieldLeftTime(6),player:getSpecialBattlefieldLeftTime(5));
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
   if (csid == 0) then

   end
end;