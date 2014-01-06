-----------------------------------
-- Area: Kuftal Tunnel
-- NPC:  ??? (qm2)
-- Note: Used to spawn Cancer & Bastok mission 8-2
-- @pos -25.238 -12.785 -148.393 174
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Kuftal_Tunnel/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	
	-- Trade quus
	if(GetMobAction(17490231) == 0 and GetMobAction(17490232) == 0 and trade:hasItemQty(4514,1) and trade:getItemCount() == 1) then 
		player:tradeComplete(); 
		
		if(math.random((1),(14)) <= 13) then
			SpawnMob(17490232,180) -- Robber Crab
		else 
			SpawnMob(17490231,180) -- Cancer about 7% chance to pop per trade
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") >= 2) then
		if(player:getVar("MissionStatus") == 2) then
			SpawnMob(17489926, 180); -- Gordov's Ghost
			SpawnMob(17489927, 180); -- Dervo's Ghost
			SpawnMob(17489928, 180); -- Gizerl's Ghost
		else
			player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
		end
	end
end;
