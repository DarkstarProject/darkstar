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
	elseif(trade:hasItemQty(1127,NumberItem) == true and trade:getItemCount() == NumberItem) then 
		player:startEvent(0x0141,1,KindredsSeal + NumberItem); -- Kindred's Seal
		player:setVar("ShamiKindredsSeal",KindredsSeal + NumberItem);
		player:tradeComplete(trade);
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	BeastmensSeal = player:getVar("ShamiBeastmensSeal");
	KindredsSeal = player:getVar("ShamiKindredsSeal");
	
	if(BeastmensSeal == 0 and KindredsSeal == 0) then 
		player:startEvent(0x0017); -- Standard dialog ?
	else
		player:startEvent(0x0142,BeastmensSeal,KindredsSeal); -- Standard dialog with menu
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



