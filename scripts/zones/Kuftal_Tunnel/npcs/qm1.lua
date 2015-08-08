-----------------------------------
-- Area: Kuftal Tunnel
-- NPC:  ??? (qm1)
-- Note: Used to spawn Phantom Worm
-- @pos 75.943 29.916 118.854 174
-----------------------------------
package.loaded["scripts/zones/Kuftal_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Kuftal_Tunnel/TextIDs");

-----------------------------------
-- onSpawn Action
-----------------------------------

function onSpawn(npc)
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local x = npc:getXPos(); 
	local y = npc:getYPos(); 
	local z = npc:getZPos(); 
	local mob = GetMobByID(17490233);
	
	-- Trade Darksteel ore
	if (GetMobAction(17490233) == 0 and trade:hasItemQty(645,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17490233,180):updateClaim(player); -- Phantom Worm
		mob:setPos(x+1,y,z+1);
	end


end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;