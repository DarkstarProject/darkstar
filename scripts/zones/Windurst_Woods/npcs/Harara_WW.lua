-----------------------------------
--	Area: Windurst Woods
--	NPC:  Harara, W.W.

-- X Grant Signet
--   Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
--   Start Supply Run Missions and offers a list of already-delivered supplies.
--   Start an Expeditionary Force by giving an E.F. region insignia to you. 
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
package.loaded["scripts/globals/conquestguards"] = nil;
require("scripts/globals/conquestguards");

NPCNation = 2;		-- NPCs Nationality (0 = Sand, 1 = Bast, 2 = Wind)
NationAlly = 3; 	-- NPC's Ally Nations (1 = Wind, 2 = Bast, 3 = None, 4 = Sand)
PlayerCP = 56000; 	-- Player Conquest Points
SandRank = 1; 		-- Sand Rank
BastRank = 1; 		-- Bast Rank
WindRank = 1; 		-- Wind Rank
CurNRank = WindRank;	-- NPC's National Rank
CanEquip = 2;		-- 1 = Player can equip, 2 = Player can't equip
DONATE_LOW_RANK = 7496;
DONATE_AT_MAXIM = 7546;
DONATE_OVERFLOW = 7547;
DONATE_CRYSTALS = 7548;
Inventory = WindInv;
size = table.getn(Inventory);

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
   if (player:getNation() == NPCNation) then
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
            end;
            if (AddPoints + player:getRankPoints() >= 4000) then
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
   Menu1 = (NPCNation * 16) + (NationAlly*256)  + 65537;
   Menu2 = 0;
   Menu3 = SandRank + (BastRank * 4) + (WindRank * 16);
   Menu4 = 1069547551 + 4194272;
   Menu5 = 1069547551;
   Menu6 = player:getRank() + (player:getNation() * 32);
   Menu7 = PlayerCP;
   Menu8 = 0;
   if(player:getNation() == NPCNation) then
	player:startEvent(0x7ff7,Menu1,Menu2,Menu3,Menu4,Menu5,Menu6,Menu7,Menu8);
   end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
   if (option >= 32768 and option <= 32944) then
      for Item = 1,size,3 do
         if (option == Inventory[Item]) then
            CPVerify = 1;
            if (PlayerCP >= Inventory[Item + 1]) then
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
   if (player:getNation() == 0 and NationAlly == 4 and SandRank >= CurNRank or 
       player:getNation() == 1 and NationAlly == 2 and BastRank >= CurNRank or 
       player:getNation() == 2 and NationAlly == 1 and WindRank >= CurNRank or
       option == 1) then
		duration = (player:getRank() + 3 + 3) * 3600;
		
		if(player:hasStatusEffect(EFFECT_SIGNET) == true) then 
			player:delStatusEffect(EFFECT_SIGNET);
			player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
		else
			player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
		end
		
   elseif (option >= 32768 and option <= 32944) then
      for Item = 1,size,3 do
         if (option == Inventory[Item]) then
            if (player:getFreeSlotsCount() >= 1) then
	       if (player:getNation() == NPCNation) then
	          PlayerCP = PlayerCP - Inventory[Item + 1];
               else
                  if (Inventory[Item + 1] <= 8000) then
                     PlayerCP = PlayerCP - Inventory[Item + 1] * 2;
                  else
                     PlayerCP = PlayerCP - Inventory[Item + 1] + 8000;
                  end;
               end;
	         player:addItem(Inventory[Item + 2],1);
	         player:messageSpecial(ITEM_OBTAINED,Inventory[Item + 2]);
            else
               player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,Inventory[Item + 2]);
            end;
            break;
	   end;
      end;
   end;
end;