-----------------------------------
-- Area: Port Jeuno
-- NPC: Shami
-- Orb Seller (BCNM)
-- @zone 246
-- @pos -14 8 44 
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	NumberItem = trade:getItemCount();
	BeastmensSeal = player:getVar("ShamiBeastmensSeal");
	KindredsSeal = player:getVar("ShamiKindredsSeal");
	
	if(trade:hasItemQty(1126,NumberItem) == true and trade:getItemCount() == NumberItem) then 
		player:startEvent(0x0141,0,BeastmensSeal + NumberItem); -- Beastmen's Seal
		player:setVar("ShamiBeastmensSeal",BeastmensSeal + NumberItem);
		player:tradeComplete(trade);
	----- This part is temporarily removed until we can find out how to enable Kindreds Seals in the csid Text. Currently we can only enabled Beastmen seals or Kindred CRESTS.
	-- elseif(trade:hasItemQty(1127,NumberItem) == true and trade:getItemCount() == NumberItem) then 
		--player:startEvent(0x0141,1,KindredsSeal + NumberItem); -- Kindred's Seal
		--player:setVar("ShamiKindredsSeal",KindredsSeal + NumberItem);
		--player:tradeComplete(trade);
	elseif(trade:hasItemQty(1551,1) == true and trade:getItemCount() == 1) then  
		if (player:getVar("CloudyOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Cloudy Orb is Cracked
			itemRemove = 1551;
			player:setVar("CloudyOrbIsCracked",0);
		else
			player:startEvent(0x0005);  -- Cloudy Orb is ok, List where you can take the orb.
		end
	elseif(trade:hasItemQty(1552,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("SkyOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Sky Orb is Cracked
			itemRemove = 1552;
			player:setVar("SkyOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Sky Orb is ok, List where you can take the orb.
		end
	elseif(trade:hasItemQty(1131,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("StarOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Star Orb is Cracked
			itemRemove = 1131;
			player:setVar("StarOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Star Orb is ok, List where you can take the orb.
		end
	elseif(trade:hasItemQty(1177,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("CometOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Comet Orb is Cracked
			itemRemove = 1177;
			player:setVar("CometOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Comet Orb is ok, List where you can take the orb.	
		end
	elseif(trade:hasItemQty(1130,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("MoonOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Moon Orb is Cracked
			itemRemove = 1130;
			player:setVar("MoonOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Moon Orb is ok, List where you can take the orb.
		end
	elseif(trade:hasItemQty(1180,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("AtroposOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Atropos Orb is Cracked
			itemRemove = 1180;
			player:setVar("AtroposOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Atropos Orb is ok, List where you can take the orb.
		end
	elseif(trade:hasItemQty(1175,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("ClothoOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Clotho Orb is Cracked
			itemRemove = 1175;
			player:setVar("ClothoOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Clotho Orb is ok, List where you can take the orb.
		end		
	elseif(trade:hasItemQty(1178,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("LachesisOrbIsCracked") == 1) then
			player:startEvent(0x0016) -- Lachesis Orb is Cracked
			itemRemove = 1178;
			player:setVar("LachesisOrbIsCracked",0);
		else
			player:startEvent(0x0009); -- Lachesis Orb is ok, List where you can take the orb.
		end
	elseif(trade:hasItemQty(1553,1) == true and trade:getItemCount() == 1) then  
		if(player:getVar("ThemisOrbIsCracked") == 1) then
			player:startEvent(0x0016); -- Themis Orb is Cracked
			itemRemove = 1553;
			player:setVar("ThemisOrbIsCracked",0);
		else
			player:startEvent(0x000b); -- Themis Orb is ok, List where you can take the orb.
		end
		
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	BeastmensSeal = player:getVar("ShamiBeastmensSeal");
	KindredsSeal = player:getVar("ShamiKindredsSeal");
	KindredsCrest = player:getVar("ShamiKindredsCrest");
	
	if(BeastmensSeal == 0 and KindredsSeal == 0) then 
		player:startEvent(0x0017); -- Standard dialog ?
	else
		player:startEvent(0x0142,BeastmensSeal,0,0,0,1,0,0,0,0); -- Standard dialog with menu
		-- Still working on these Params. The first param checks if you have beastmen seals, if you have more then 0 it enables the beastmen seal text. Param2 is the same but for Kindred Crests.
	end
end; 
 
-- 0x0032 : 30 sceau conférie : choix entre clotho et lachésis
-- 0x0018 : Après achat d'un orb (qu'bia, yughott, palborough, giddeus)
-- 0x0008 : Après achat d'un orb (yughott, palborough, giddeus, qu'bia, ghelsba)
-- 0x0004 : Après achat d'un orb (yughott, palborough, giddeus, ghelsba)
-- 0x000a : Après achat d'un orb (yughott, palborough, giddeus)
-- 0x0009 : Trade d'un orb ? (yughott, palborough, giddeus, ghelsba)
-- 0x0005 : Trade d'un orb ? (yughott, palborough, giddeus, ghelsba)
-- 0x000b : Trade d'un orb ? (yughott, palborough, giddeus)
-- 0x001a : Trade d'un orb ? (qu'bia, yughott, palborough, giddeus)
-- 0x001b : Trade d'un orb ? (qu'bia, chambre des oracles)
-- 0x0016 : Trade d'un orb utilisé (il le recup)
-- 0x0019 : Un seul échange autorisé par semaine
-- 0x0141 : trade sceau + nombre player:startEvent(0x0141,0,15); 
--          0 shbete, 1 s-confrerie, 2 s-demons, 3 s-seigneurdes hombre

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
printf("CSID: %u",csid);
printf("RESULT: %u",option);
	beastmensSeals = player:getVar("ShamiBeastmensSeal");
	kindredsSeal = player:getVar("ShamiKindredsSeal");
	if(option == 1073741824) then  -- This option is returned when someone hits the "escape" key to interrupt the Cutscene
					-- Without this space players will receive items when escaping.
	elseif (csid == 0x0016) then
		player:delItem(itemRemove);
	elseif (option >= 510) then  -- Player has asked to retrieve seals
		
		if (player:getFreeSlotsCount() >=1) then
			bSealCount = (option - 254)/256; -- Every seal requested adds 256 to the option value. The lowest is one seal which sets the option to 510, two seals would be 510 + 256. etc
			player:setVar("ShamiBeastmensSeal",beastmensSeals - bSealCount);
			player:addItem(1126,bSealCount); 
			player:messageSpecial(ITEM_OBTAINED,1126);
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1126);
		end
		
----------------------------------------------------------------------------------------------------------------------------
-------- Begin BCNM orb Handout --------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------			
	elseif (csid == 0x0142) then
		if (option == 1 and beastmensSeals >= 20) then  -- Player asked for Cloudy orb
			if(player:getFreeSlotsCount() >= 1 and player:hasItem(1551) == false) then
				player:setVar("ShamiBeastmensSeal",beastmensSeals - 20);
				player:addItem(1551);
				player:messageSpecial(ITEM_OBTAINED,1551);
			elseif(player:hasItem(1551) == true)then
				player:addItem(1551);  -- does not add the item but forces it to send the "you cannot carry anymore of these" message.
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1551);
			end
			
		elseif (option == 2 and beastmensSeals >= 30) then   -- Player asked for Sky orb
			if(player:getFreeSlotsCount() >= 1 and player:hasItem(1552) == false) then
				player:setVar("ShamiBeastmensSeal",beastmensSeals - 30);
				player:addItem(1552);
				player:messageSpecial(ITEM_OBTAINED,1552);
			elseif(player:hasItem(1552) == true)then
				player:addItem(1552);  -- does not add the item but forces it to send the "you cannot carry anymore of these" message.
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1552);
			end		
		elseif (option == 3 and beastmensSeals >= 40) then   -- Player asked for Star orb
			if(player:getFreeSlotsCount() >= 1 and player:hasItem(1131) == false) then
				player:setVar("ShamiBeastmensSeal",beastmensSeals - 40);
				player:addItem(1131);
				player:messageSpecial(ITEM_OBTAINED,1131);
			elseif(player:hasItem(1131) == true)then
				player:addItem(1131);  -- does not add the item but forces it to send the "you cannot carry anymore of these" message.
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1131);
			end
		elseif (option == 4 and beastmensSeals >= 50) then   -- Player asked for Comet orb
			if(player:getFreeSlotsCount() >= 1 and player:hasItem(1177) == false) then
				player:setVar("ShamiBeastmensSeal",beastmensSeals - 50);
				player:addItem(1177);
				player:messageSpecial(ITEM_OBTAINED,1177);
			elseif(player:hasItem(1177) == true)then
				player:addItem(1177);  -- does not add the item but forces it to send the "you cannot carry anymore of these" message.
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1177);
			end	
		elseif (option == 5 and beastmensSeals >= 60) then   -- Player asked for Moon orb
			if(player:getFreeSlotsCount() >= 1 and player:hasItem(1130) == false) then
				player:setVar("ShamiBeastmensSeal",beastmensSeals - 60);
				player:addItem(1130);
				player:messageSpecial(ITEM_OBTAINED,1130);
			elseif(player:hasItem(1130) == true)then
				player:addItem(1130);  -- does not add the item but forces it to send the "you cannot carry anymore of these" message.
			else
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1130);
			end				
		end
	end
end;



