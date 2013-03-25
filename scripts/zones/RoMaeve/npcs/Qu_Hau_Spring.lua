-----------------------------------	
-- Qu_Hau_Spring
-- Area: Ro'Maeve
-----------------------------------	
	
require("/scripts/globals/settings");	



-- TODO:
-- Can only get Ark Pentasphere if
-- 1. The moon is full (Done)
-- 2. game time must be between 0:00 - 3:00
-- 3. weather must be clear
	
	
-----------------------------------	
-- onTrigger Action	
-----------------------------------	
	
function onTrigger(player,npc)	
end;	
	
-----------------------------------	
-- onTrade Action	
-----------------------------------	
	
function onTrade(player,npc,trade)	

	if(trade:hasItemQty(1408,1) and trade:hasItemQty(917,1) and trade:getItemCount() == 2 and IsMoonFull() == true) then
		
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1550);
		else 
			player:addItem(1550);
			player:messageSpecial(ITEM_OBTAINED,1550);
			player:tradeComplete();
		end
	end

end;	
	
-----------------------------------	
-- onEventSelection	
-----------------------------------	
	
function onEventUpdate(player,csid,menuchoice)	
end;	
	
-----------------------------------	
-- onEventFinish Action	
-----------------------------------	
	
function onEventFinish(player,csid,option)	
end;	
