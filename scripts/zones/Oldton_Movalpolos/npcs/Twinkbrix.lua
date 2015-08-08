-----------------------------------
--  Area: Oldton Movalpolos
--  NPC:  Twinkbrix
--  Type: Warp NPC
--  @pos -292.779 6.999 -263.153 11
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/zones/Oldton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local mineShaftWarpCost = 2000;
	local tradeGil = trade:getGil();
	
	if (player:hasKeyItem(SHAFT_GATE_OPERATING_DIAL) and tradeGil == mineShaftWarpCost) then
		player:startEvent(0x0038);
	elseif (player:hasKeyItem(SHAFT_GATE_OPERATING_DIAL) == false and tradeGil > 0 and tradeGil <= 10000) then
		local maxRoll = tradeGil / 200;
		local diceRoll = math.random((2),(100));
		player:startEvent(0x0037, tradeGil, maxRoll, diceRoll, mineShaftWarpCost);		
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(SHAFT_GATE_OPERATING_DIAL)) then
		player:startEvent(0x0032);
	else
		player:startEvent(0x0034);
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
 
 if (csid == 0x0037 and option == 1) then 	
   	player:addKeyItem(SHAFT_GATE_OPERATING_DIAL);
   	player:messageSpecial(KEYITEM_OBTAINED,SHAFT_GATE_OPERATING_DIAL);
   	player:tradeComplete();
 elseif (csid == 0x0037 and option == 0) then
 	player:tradeComplete();
 elseif (csid == 0x0038 and option == 1) then
 	player:tradeComplete();
 	toMineShaft2716(player);
 end
 
end;