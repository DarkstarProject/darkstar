-----------------------------------
-- Area: Lower Jeuno
-- NPC: Alrauverat
-- @zone 245
-- @pos -101 0 -182

-- X Grant Signet
--   Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
-------------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/Lower_Jeuno/TextIDs");
require("scripts/globals/conquestguards");

PlayerCP = 56000; 	-- Player Conquest Points
CanEquip = 2;		-- 1 = Player can equip, 2 = Player can't equip
DONATE_LOW_RANK = 7905;
DONATE_AT_MAXIM = 7955;
DONATE_OVERFLOW = 7956;
DONATE_CRYSTALS = 7957;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	TradeCount = trade:getItemCount();
	for Crystal = 1,table.getn(DonateCrys),1 do
		TradeCrys = trade:hasItemQty(DonateCrys[Crystal],TradeCount);
		if (TradeCrys == true) then
			if (player:getRank() == 1) then
				player:showText(npc,DONATE_LOW_RANK);
				break; 
			elseif (player:getRankPoints() == 4000) then
				player:showText(npc,DONATE_AT_MAXIM);
				break;
			elseif (DonateCrys[Crystal] == 4102 or DonateCrys[Crystal] == 4103 or 
				DonateCrys[Crystal] == 4244 or DonateCrys[Crystal] == 4245) then
				AddPoints = TradeCount * math.floor(4000 / (player:getRank() * 12 - 16));
			else
				AddPoints = TradeCount * math.floor(4000 / (player:getRank() * 12 - 12));
			end
			if (AddPoints + player:getRankPoints() >= 4000) then
				PlayerCP = PlayerCP + (AddPoints + player:getRankPoints()) - 4000;
				player:setRankPoints(4000);
				player:showText(npc,DONATE_OVERFLOW);
			else
				player:addRankPoints(AddPoints);
				player:showText(npc,DONATE_CRYSTALS);
			end
			player:tradeComplete();
			break;
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	Menu1 = (player:getNation() * 16) + (3 * 256)  + 65537;
	Menu2 = 0;
	Menu3 = player:getRank();
	Menu4 = 1069547551 + 4194272;
	Menu5 = 1069547551;
	Menu6 = player:getRank() + (player:getNation() * 32);
	Menu7 = PlayerCP;
	Menu8 = 0;
	
	player:startEvent(0x7ffb,Menu1,Menu2,Menu3,Menu4,Menu5,Menu6,Menu7,Menu8); 
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	if(player:getNation() == 0) then 
		Inventory = SandInv;
		size = table.getn(SandInv);
	elseif(player:getNation() == 1) then 
		Inventory = BastInv;
		size = table.getn(BastInv);
	else 
		Inventory = WindInv;
		size = table.getn(WindInv);
	end
	
	if (option >= 32768 and option <= 32944) then
		for Item = 1,size,3 do
			if (option == Inventory[Item]) then
				CPVerify = 1;
				if (PlayerCP >= Inventory[Item + 1]) then
					CPVerify = 0;
				end
			
			player:updateEvent(CanEquip,CPVerify,Inventory[Item + 2]);
			break;
			end
		end
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	if (option == 1) then
		duration = (player:getRank() + 3 + 3) * 3600;
		
		if(player:hasStatusEffect(EFFECT_SIGNET) == true) then 
			player:delStatusEffect(EFFECT_SIGNET);
			player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
		else
			player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
		end
	elseif (option >= 32768 and option <= 32944) then
		if(player:getNation() == 0) then size = table.getn(SandInv);
		elseif(player:getNation() == 1) then size = table.getn(BastInv);
		else size = table.getn(WindInv);
		end
		
		for Item = 1,size,3 do
			if (option == Inventory[Item]) then
				if (player:getFreeSlotsCount() >= 1) then
					PlayerCP = PlayerCP - Inventory[Item + 1];
					player:addItem(Inventory[Item + 2],1);
					player:messageSpecial(ITEM_OBTAINED,Inventory[Item + 2]);
				else
					player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,Inventory[Item + 2]);
				end
				break;
			end
		end
	end
end;