-----------------------------------
-- Area: Bastok Mines
-- NPC:  Crying Wind, I.M.

-- X Grant Signet
--   Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
-- X Start Supply Run Missions and offers a list of already-delivered supplies.
--   Start an Expeditionary Force by giving an E.F. region insignia to you. 
-------------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/conquest");
require("scripts/globals/conquestguards");
require("scripts/zones/Bastok_Mines/TextIDs");

NPCNation = 1;		-- NPCs Nationality (0 = Sand, 1 = Bast, 2 = Wind)
NationAlly = 3; 	-- NPC's Ally Nations (1 = Wind, 2 = Bast, 3 = None, 4 = Sand)
PlayerCP = 56000; 	-- Player Conquest Points
SandRank = 1; 		-- Sand Rank
BastRank = 1; 		-- Bast Rank
WindRank = 1; 		-- Wind Rank
CurNRank = BastRank;	-- NPC's National Rank
CanEquip = 2;		-- 1 = Player can equip, 2 = Player can't equip
DONATE_LOW_RANK = 7496;
DONATE_AT_MAXIM = 7546;
DONATE_OVERFLOW = 7547;
DONATE_CRYSTALS = 7548;
Inventory = BastInv;
size = table.getn(Inventory);

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   if(player:getNation() == NPCNation) then
      TradeCount = trade:getItemCount();
      for Crystal = 1,table.getn(DonateCrys),1 do
         TradeCrys = trade:hasItemQty(DonateCrys[Crystal],TradeCount);
         if(TradeCrys == true) then
            if(player:getRank() == 1) then
               player:showText(npc,DONATE_LOW_RANK);
               break; 
            elseif(player:getRankPoints() == 4000) then
               player:showText(npc,DONATE_AT_MAXIM);
               break;
           elseif(DonateCrys[Crystal] == 4102 or DonateCrys[Crystal] == 4103 or 
                   DonateCrys[Crystal] == 4244 or DonateCrys[Crystal] == 4245) then
              AddPoints = TradeCount * math.floor(4000 / (player:getRank() * 12 - 16));
            else
               AddPoints = TradeCount * math.floor(4000 / (player:getRank() * 12 - 12));
            end;
            if(AddPoints + player:getRankPoints() >= 4000) then
               PlayerCP = PlayerCP + (AddPoints + player:getRankPoints()) - 4000;
               player:setRankPoints(4000);
               player:showText(npc,DONATE_OVERFLOW);
            else
               player:addRankPoints(AddPoints);
               player:showText(npc,DONATE_CRYSTALS);
            end;
            player:tradeComplete();
            break;
         end;
      end;
   end;
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
	SupplyAvailable = 0;
	SupplyDone = 0;
	startnumber = 32;
	LvL = player:getMainLvl()
   
	for nb = 1,128,8 do
		if(player:getVar(SupplyRun[nb + 5]) == 1) then
			SupplyDone = SupplyDone + startnumber;
		end
		
		if(LvL < SupplyRun[nb + 6] or getRegionOwner(SupplyRun[nb + 7]) ~= NPCNation) then
			SupplyAvailable = SupplyAvailable + startnumber;
		end
		
		startnumber = startnumber * 2;
	end
   
	Menu1 = (NPCNation * 16) + (NationAlly*256)  + 65537;
	Menu2 = 0;
	Menu3 = SandRank + (BastRank * 4) + (WindRank * 16);
	Menu4 = 2145386527 + SupplyAvailable;
	Menu5 = SupplyDone;
	Menu6 = player:getRank() + (player:getNation() * 32);
	Menu7 = PlayerCP;
	Menu8 = 0;

	if(player:getNation() == NPCNation) then
		player:startEvent(0x7FF9,Menu1,Menu2,Menu3,Menu4,Menu5,Menu6,Menu7,Menu8);
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
   if(option >= 32768 and option <= 32944) then
      for Item = 1,size,3 do
         if(option == Inventory[Item]) then
            CPVerify = 1;
            if(PlayerCP >= Inventory[Item + 1]) then
               CPVerify = 0;
            end;
            player:updateEvent(CanEquip,CPVerify,Inventory[Item + 2]);
            break;
         end;
      end;
   end;
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)

	if(option == 1) then -- Grant Signet
		player:delStatusEffect(EFFECT_SIGNET);
		ranktime = player:getRank() * 60 * 60;
		duration = ranktime + 0 + 10800;
		player:addStatusEffect(EFFECT_SIGNET,0,0,duration,0,0);
		
	elseif(option >= 32768 and option <= 32944) then -- CP Item
		for Item = 1,size,3 do
			if(option == Inventory[Item]) then
				if(player:getFreeSlotsCount() >= 1) then
					if(player:getNation() == NPCNation) then
						PlayerCP = PlayerCP - Inventory[Item + 1];
					else
						if(Inventory[Item + 1] <= 8000) then
							PlayerCP = PlayerCP - Inventory[Item + 1] * 2;
						else
							PlayerCP = PlayerCP - Inventory[Item + 1] + 8000;
						end
					end
					player:addItem(Inventory[Item + 2],1);
					player:messageSpecial(ITEM_OBTAINED,Inventory[Item + 2]);
				else
					player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,Inventory[Item + 2]);
				end
				break
			end
		end
	
	elseif(option >= 65541 and option <= 65556) then -- Supply Run quest
		for nb = 1, 128, 8 do
			if(option == SupplyRun[nb]) then
				supDay = player:getVar("supplyRun_Day");
				TP = player:getVar(SupplyRun[nb+5]);
				KI = player:hasKeyItem(SupplyRun[nb+1]);
				
				if(supDay == VanadielDayOfTheYear()) then
					player:messageSpecial(WAIT_VANADIEL_DAY);
				elseif(TP == 0 and KI == false) then
					player:addKeyItem(SupplyRun[nb+1]);
					player:messageSpecial(KEYITEM_OBTAINED,SupplyRun[nb+1]);
					player:setVar("supplyRun_Day",VanadielDayOfTheYear());
				end
			end
		end
	end
	
end;