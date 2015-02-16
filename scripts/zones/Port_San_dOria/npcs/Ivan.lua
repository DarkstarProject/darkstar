-----------------------------------
-- Area: Port San d'Oria
-- NPC: Ivan
-- Abyssea warp npc
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[ bitcount
 	1 = La Theine 
	2 = Konschtat 
	4 = Tahrongi 
	8 = Vunkerl 
	16 = Misareaux 
	32 = Attohwa  
	64 = Altepa  
	128 = Uleguerand 
	256 = Grauberg			
	total = 511
]]--
	local AbysseaStatus = 1; -- player:getVar("AbysseaStatus");
	local MawUnlock = 0;
	local cruor = player:getCruor();
	if (MAW_UNLOCK == true) then
		MawUnlock = 511;
	else 
		MawUnlock = player:getVar("MawUnlock[BIT]");
	end
	--print("onEventSelection")
   -- print("onEventSelection - CSID:",csid);
   -- print("onEventSelection - option ===",option);
	player:startEvent(795,AbysseaStatus,cruor,511);
	
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
	cost = 200;
	if(option == 262) then 		--La Theine Plateau (E-4)["La Theine"]
		player:setPos(-562, 0, 667, 62, 102);
		
	elseif(option == 266) then 	--Konschtat Highlands (I-12)["Konschtat"]
		player:setPos(81, -67, -580, 11, 108);
		
	elseif(option == 270) then 	--Tahrongi Canyon (H-12)["Tahrongi"]
		player:setPos(-6, 40, -677, 123, 117);
		
	elseif(option == 278) then 	--Valkurm Dunes (I-9)["Misareaux"]
		player:setPos(351, 0, -116, 8, 103);
		
	elseif(option == 274) then 	--Jugner Forest (J-8)["Vunkerl"] 
		player:setPos(231, 0, 13, 20, 104);
		
	elseif(option == 282) then 	--Buburimu Peninsula (F-7)["Attohwa"]
		player:setPos(-328, -23, 42, 168, 118);			
		
	elseif(option == 286) then 	--South Gustaberg (J-10)["Altepa"]
		player:setPos(338, 0, -660, 55, 107);	
		
	elseif(option == 294) then 	--North Gustaberg (G-6)["Grauberg"]
		player:setPos(-57, 0, 600, 126, 106);		
	
	elseif(option == 290) then 	--Xarcabard (H-8)["Uleguerand"]
		player:setPos(270, -7, -84, 192, 112);	
	end
	player:delCruor(cost);
	--print("onEventFinish")
   --print("onEventFinish - CSID:",csid);
    --print("onEventFinish - option ===",option);
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




