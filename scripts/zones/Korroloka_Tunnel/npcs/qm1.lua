-----------------------------------
-- Area: Korroloka Tunnel
-- NPC:  ??? (qm1) - Morion Worm spawn
-- @pos 254.652 -6.039 20.878 173
-----------------------------------
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/TextIDs");

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
	local mob = GetMobByID(17486190);
	
	-- Trade Darksteel ore
	if (GetMobAction(17486190) == 0 and trade:hasItemQty(643,1) and trade:getItemCount() == 1) then 
		player:tradeComplete();
		SpawnMob(17486190,1800):updateClaim(player); -- Morion Worm
		mob:setPos(x+1,y,z);
	end


end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(MORION_WORM_1);
end;