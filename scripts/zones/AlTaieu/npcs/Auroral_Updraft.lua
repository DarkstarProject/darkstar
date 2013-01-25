-----------------------------------
--  Area: Al'Taieu
--   NPC: Auroral Updraft
--  Type: Standard NPC
-- @zone: 33
--  @pos: 
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/AlTaieu/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

npcid = npc:getID();

if(npcid == 16912899) then
player:startEvent(0x0096);
return 1;
end
if(npcid == 16912900) then
player:startEvent(0x009B);
return 1;
end
if(npcid == 16912901) then
player:startEvent(0x009B);
return 1;
end
if(npcid == 16912902) then
player:startEvent(0x009B);
return 1;
end
if(npcid == 16912903) then
player:startEvent(0x009B);
return 1;
end
if(npcid == 16912904) then
player:startEvent(0x009B);
return 1;
end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
if(csid == 0x009B) and option == 1 then
player:setPos(-25,-1 ,-620 ,208 ,33);
end
if(csid == 0x0096) and option == 1 then
player:setPos(611, 132, 773, 195, 32)
end 
end;
