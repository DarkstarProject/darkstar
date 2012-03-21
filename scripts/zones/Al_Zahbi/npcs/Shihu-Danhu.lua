-----------------------------------
--  Area: Al Zahbi
--   NPC: Shihu-Danhu
--  Type: Teleporter
-- @zone: 48
--  @pos: 62.768 -1.98 -51.299
-----------------------------------

require("scripts/globals/teleports");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0067);
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
	
	if (csid == 0x0067 and option == 1) then
		warp = math.random(1,5);
		if (warp == 1) then
			toRuLudeGardens(player);
		elseif (warp == 2) then
			player:setPos(373.996, 7.164, -106.588, -35, 105); -- Batallia Downs
		elseif (warp == 3) then
			player:setPos(-327.325, 2.000, 438.500, 190, 120); -- Sauromugue Chapaign
		elseif (warp == 4) then
			player:setPos(213.125, 16.000, 419.125, 210, 110); -- Rolanberry Fields
		elseif (warp == 5) then
			player:setPos(181.850, 15.000, -171.250, 80, 126); -- Qufim Island
		end
	end
end;