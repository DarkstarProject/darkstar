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
 player:updateEvent(0,player:getSpecialInstanceLeftTime(2),player:getSpecialInstanceLeftTime(1),player:getSpecialInstanceLeftTime(4),player:getSpecialInstanceLeftTime(3),player:getSpecialInstanceLeftTime(6),player:getSpecialInstanceLeftTime(5));
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
   if(csid == 0)then

   end
end;