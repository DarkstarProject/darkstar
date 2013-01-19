-----------------------------------	
-- Stale_Draft
-- Area: Sacrarium
-----------------------------------	
	
	

	
-----------------------------------	
-- onTrigger Action	
-----------------------------------	
	
function onTrigger(player,npc)	
	local Hate = player:getVar("FOMOR_HATE");	
		   if (Hate < 8) then --hate lvl 1
		    player:messageSpecial(7302);--There is nothing out of the ordinary here
		   elseif (Hate < 12) then
		    player:messageSpecial(7303); --You start to get goosebumps.
		   elseif (Hate < 50) then
		    player:messageSpecial(7304);--Your heart is racing.
		   elseif (Hate >= 50) then
		    player:messageSpecial(7305);--Your common sense tells you to leave as quickly as possible.
     end		   	
end;	
	
	
-----------------------------------	
-- onTrade Action	
-----------------------------------	
	
function onTrade(player,npc,trade)	
  if (trade:hasItemQty(1877,1) and trade:getItemCount() == 1) then  --trade 1 fomor codex
	local X = npc:getXPos();
	local Race = player:getRace();
	local Hate = player:getVar("FOMOR_HATE");
	
	
	if (X == 73)then --luaith spawnpoint--
		if ((Race==3 or Race==4)and GetMobAction(16892069) == 0) then  --elvaan
            if (Hate >= 50) then
			player:setVar("FOMOR_HATE",0); --reset fomor hate
            player:tradeComplete();
			SpawnMob(16892069,180):updateEnmity(player);
			else
			player:messageSpecial(7308);--Nothing happens
		    end		   
		else
		 player:messageSpecial(7308);--Nothing happens
		end		
	
	elseif (X == 7) then --Caithleann spawnpoint
	    if (Race==7 and GetMobAction(16892073) == 0) then  -- mithra 
            if (Hate >= 50) then
			player:setVar("FOMOR_HATE",0); --reset fomor hate
			player:tradeComplete();
		    SpawnMob(16892073,180):updateEnmity(player);
			else
			player:messageSpecial(7308);--Nothing happens
		   end		   
		else
		 player:messageSpecial(7308);--Nothing happens
		end		
	
	elseif (X == 47) then --Indich spawnpoint
	    if (Race==8 and GetMobAction(16892074) == 0) then  --galka 
            if (Hate >= 50) then
			player:setVar("FOMOR_HATE",0); --reset fomor hate
			player:tradeComplete();
			SpawnMob(16892074,180):updateEnmity(player);
			else
			player:messageSpecial(7308);--Nothing happens
		   end		   
		else
		 player:messageSpecial(7308);--Nothing happens
		end	
	
	elseif (X == 113) then --Lobais spawnpoint
	    if ((Race==5 or Race==6 )and GetMobAction(16892070) == 0) then  --tarutaru 
            if (Hate >= 50) then
			player:setVar("FOMOR_HATE",0); --reset fomor hate
			player:tradeComplete();
			SpawnMob(16892070,180):updateEnmity(player);
			else
			player:messageSpecial(7308);--Nothing happens
		   end		   
		else
		 player:messageSpecial(7308);--Nothing happens
		end	
	elseif (X == 33) then --Balor spawnpoint--
	    if ((Race==2 or Race==1)and GetMobAction(16892068) == 0) then  -- hume
	        if (Hate >= 50) then
			player:setVar("FOMOR_HATE",0); --reset fomor hate
			player:tradeComplete();
			SpawnMob(16892068,180):updateEnmity(player);
			else
			player:messageSpecial(7308);--Nothing happens
		    end		   
		else
		 player:messageSpecial(7308);--Nothing happens
		end		
	end	

  end









end;	
	

	
-----------------------------------	
-- onEventFinish Action	
-----------------------------------	
	
function onEventFinish(player,csid,option)	
	
end;	
