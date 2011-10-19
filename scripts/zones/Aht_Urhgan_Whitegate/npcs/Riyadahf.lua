-----------------------------------
-- Area: Aht'Urhgan Whitegate
-- NPC: Riyadahf
-- Map Seller NPC
-----------------------------------

package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Aht_Urhgan_Whitegate/textids");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

mapVar = 0;

	if player:hasKeyItem(MAP_OF_AL_ZAHBI) then
		   mapVar = mapVar + 4;
	end
	if player:hasKeyItem(MAP_OF_NASHMAU) then
		   mapVar = mapVar + 8;
	end
	if player:hasKeyItem(MAP_OF_WAJAOM_WOODLANDS) then
		   mapVar = mapVar + 16;
	end
	if player:hasKeyItem(MAP_OF_BHAFLAU_THICKETS) then
		   mapVar = mapVar + 32;
	end
    player:startEvent(0x0233, mapVar);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
keyItem = option;
gil = 0;

  if (csid==0x0233 and option ~= 1073741824) then
	if option == MAP_OF_AL_ZAHBI then
		gil = 600;
 	elseif option == MAP_OF_NASHMAU then
		gil = 3000;
	elseif option == MAP_OF_WAJAOM_WOODLANDS then
		gil = 3000;
	elseif option == MAP_OF_BHAFLAU_THICKETS then
		gil = 3000;
	end

	if (gil > 0 and player:getGil() >= gil) then
	   player:setGil(player:getGil() - gil);
	   player:addKeyItem(option);
	   player:messageSpecial(KEYITEM_OBTAINED,keyItem); 
	else
	   player:messageSpecial(0220);
    	end
  end
end;




