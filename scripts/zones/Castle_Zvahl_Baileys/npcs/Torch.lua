-----------------------------------
-- Area: Castle Zvahl Baileys
-- NPC: Torch (x4)
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- @zone 161
-- @pos 63 -24 21
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	OldGauntlets = player:hasKeyItem(OLD_GAUNTLETS);
	ShadowFlames = player:hasKeyItem(SHADOW_FLAMES);
	BorghertzCS = player:getVar("BorghertzCS");
	X = player:getXPos();
	Z = player:getZPos();
	
	if (OldGauntlets == true and ShadowFlames == false and BorghertzCS >= 2) then
		if (player:getVar("BorghertzSparkKilled") == 1) then 
			if (X >= 57 and X <= 67 and Z >= 20 and Z <= 26) then -- Right Torch
				if (player:getVar("BorghertzChooseTorch") == 2) then 
					player:addKeyItem(211);
					player:messageSpecial(KEYITEM_OBTAINED,211);
					player:setVar("BorghertzSparkKilled",0);
					player:setVar("BorghertzChooseTorch",0);
					player:setVar("BorghertzCS",0);
				else
					player:messageSpecial(SENSE_OF_FOREBODING);
					SpawnMob(17436964,180):updateClaim(player);
					player:setVar("BorghertzSparkKilled",0);
					player:setVar("BorghertzChooseTorch",2);
				end
			elseif (X >= 57 and X <= 67 and Z >= 13 and Z <= 20) then -- Left Torch
				if (player:getVar("BorghertzChooseTorch") == 1) then 
					player:addKeyItem(211);
					player:messageSpecial(KEYITEM_OBTAINED,211);
					player:setVar("BorghertzSparkKilled",0);
					player:setVar("BorghertzChooseTorch",0);
					player:setVar("BorghertzCS",0);
				else
					player:messageSpecial(SENSE_OF_FOREBODING);
					SpawnMob(17436964,180):updateClaim(player);
					player:setVar("BorghertzSparkKilled",0);
					player:setVar("BorghertzChooseTorch",1);
				end
			end
		else
			if (X >= 57 and X <= 67 and Z >= 20 and Z <= 26) then -- Right Torch
				player:messageSpecial(SENSE_OF_FOREBODING);
				SpawnMob(17436964,180):updateClaim(player);
				player:setVar("BorghertzChooseTorch",2);
			elseif (X >= 57 and X <= 67 and Z >= 13 and Z <= 20) then -- Left Torch
				player:messageSpecial(SENSE_OF_FOREBODING);
				SpawnMob(17436964,180):updateClaim(player);
				player:setVar("BorghertzChooseTorch",1);
			end
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;



