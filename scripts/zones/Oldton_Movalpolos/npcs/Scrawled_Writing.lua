-----------------------------------
-- Area: Oldton Movalpolos
-- NPC:  Scrawled Writings
-- Allows players to spawn Goblin Wolfman with Goblin Drink.
-- @pos 257 -70 517 130
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Oldton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local x = npc:getXPos();
	local y = npc:getYPos();
	local z = npc:getZPos();
	local mob = GetMobByID(16822459);


	if(GetMobAction(16822459) == 0 and trade:hasItemQty(4541,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		SpawnMob(16822459,300):updateEnmity(player);
		mob:setPos(x-1,y,z);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(SKY_GOD_OFFSET);
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
end;
