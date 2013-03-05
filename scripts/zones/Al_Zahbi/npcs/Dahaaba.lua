-----------------------------------
--  Area: Al Zahbi
--   NPC: Dahaaba
--  Type: Chocobo Renter
-- @zone: 48
--  @pos: -65.309 -1 -39.585
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Al_Zahbi/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	price = 100;
	gil = player:getGil();

	if(player:hasKeyItem(CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
		player:startEvent(0x010e,price,gil);
	else
		player:startEvent(0x010ef,price,gil);
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
	
	price = 100;
	level = player:getMainLvl();

	if(csid == 0x010e and option == 0) then
		if(level >= 20) then
			player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,1,0,1800,true);
		else
			player:addStatusEffectEx(EFFECT_CHOCOBO,EFFECT_CHOCOBO,1,0,900,true);
		end
		player:delGil(price);
		player:setPos(610,-24,356,0x80,0x33);
	end
	
end;