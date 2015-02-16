-----------------------------------
-- 	Kaduru-Haiduru
-- 	Pay-Teleport taru
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/teleports");


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:showText( npc, 9242 );
	player:showText( npc, 9243 );
--accept = 0;
--event  = 0x0249;

--	if (player:getGil() < 300)then
--		accept = 1;
--	end
--	if (player:getMainLvl() < EXPLORER_MOOGLE_LEVELCAP) then
--		event = event + 1;
--	end
--	player:startEvent(event,player:getZone(),0,accept);
end;



-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (trade:getItemCount() == 1 and trade:hasItemQty(0x889,1) == true) then
		player:tradeComplete();
		player:showText( npc, 9246 );
		player:setPos(114, 0, -8, 5, 231);
	end
	if (trade:getItemCount() == 1 and trade:hasItemQty(0x88B,1) == true) then
		player:tradeComplete();
		player:showText( npc, 9246 );
		player:setPos(-17, 0, 13, 24, 245); --Goldpiece to Jeuno
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

--local price = 25000;

	--if (csid == 0x032f) then
	--		if (option == 1) then
	--		toExplorerMoogle(player,231);
	--	elseif (option == 2) then
	--		toExplorerMoogle(player,234);
	--	elseif (option == 3) then
	--		toExplorerMoogle(player,240);
	--	elseif (option == 4) then
	--		toExplorerMoogle(player,248);
	--	elseif (option == 5) then
	--		toExplorerMoogle(player,249);
	--	end
	--end
end;
