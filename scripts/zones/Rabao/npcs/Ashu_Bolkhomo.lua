-----------------------------------
-- Area: Rabao
-- NPC: Ashu Bolkhomo
-- Map Seller NPC
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Rabao/textids");
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

	if player:hasKeyItem(MAP_OF_THE_KUZOTZ_REGION) then
		   mapVar = mapVar + 4;
	end
	if player:hasKeyItem(MAP_OF_THE_VOLLBOW_REGION) then
		   mapVar = mapVar + 8;
	end
	if player:hasKeyItem(MAP_OF_THE_KORROLOKA_TUNNEL) then
		   mapVar = mapVar + 16;
	end
    player:startEvent(0x03ee, mapVar);
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

  if (csid==0x03ee and option ~= 1073741824) then
	if option == MAP_OF_THE_KUZOTZ_REGION then
		gil = 3000;
 	elseif option == MAP_OF_THE_VOLLBOW_REGION then
		gil = 3000;
	elseif option == MAP_OF_THE_KORROLOKA_TUNNEL then
		gil = 3000;
	end

	if (gil > 0 and player:getGil() >= gil) then
	   player:setGil(player:getGil() - gil);
	   player:addKeyItem(option);
	   player:messageSpecial(KEYITEM_OBTAINED,keyItem); 
	else
	   player:messageSpecial(6386);    
	end
  end
end;



