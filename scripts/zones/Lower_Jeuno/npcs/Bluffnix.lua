-----------------------------------
-- Area: Lower Jeuno
-- NPC: Bluffnix
-- Starts and Finishes Quests: Gobbiebags I-X 
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	count = trade:getItemCount();
	gil = trade:getGil();
	inventorySize = player:getContainerSize(0);
	gobbieBag = (inventorySize/5) - 5;	
	
	if (count == 4 and gil == 0 and player:getQuestStatus(JEUNO,(gobquest(player,gobbieBag))) == 1) then
		if (inventorySize == 30) then
			if (trade:hasItemQty(0848,1) and trade:hasItemQty(0652,1) and trade:hasItemQty(0826,1) and trade:hasItemQty(0788,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Dhalmel Leather, Steel Ingot, Linen Cloth, Peridot
			end
		elseif (inventorySize == 35) then
			if (trade:hasItemQty(0851,1) and trade:hasItemQty(0653,1) and trade:hasItemQty(0827,1) and trade:hasItemQty(0798,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Ram Leather, Mythril Ingot, Wool Cloth, Turquoise
			end
		elseif (inventorySize == 40) then
			if (trade:hasItemQty(0855,1) and trade:hasItemQty(0745,1) and trade:hasItemQty(0828,1) and trade:hasItemQty(0797,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Tiger Leather, Gold Ingot, Velvet Cloth, Painite
			end
		elseif (inventorySize == 45) then
			if (trade:hasItemQty(0931,1) and trade:hasItemQty(0654,1) and trade:hasItemQty(0829,1) and trade:hasItemQty(0808,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Cermet Chunk, Darksteel Ingot, Silk Cloth, Goshenite
			end
		elseif (inventorySize == 50) then
			if (trade:hasItemQty(1637,1) and trade:hasItemQty(1635,1) and trade:hasItemQty(1636,1) and trade:hasItemQty(1634,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Bugard Leather, Paktong Ingot, Moblinweave, Rhodonite
			end
		elseif (inventorySize == 55) then
			if (trade:hasItemQty(1741,1) and trade:hasItemQty(1738,1) and trade:hasItemQty(1739,1) and trade:hasItemQty(1740,1)) then
				player:startEvent(0x0049, inventorySize+1); -- HQ Eft Skin, Shakudo Ingot, Balloon Cloth, Iolite
			end
		elseif (inventorySize == 60) then
			if (trade:hasItemQty(2530,1) and trade:hasItemQty(0655,1) and trade:hasItemQty(0830,1) and trade:hasItemQty(0812,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Lynx Leather, Adaman Ingot, Rainbow Cloth, Deathstone
			end
		elseif (inventorySize == 65) then
			if (trade:hasItemQty(2529,1) and trade:hasItemQty(2536,1) and trade:hasItemQty(2537,1) and trade:hasItemQty(0813,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Smilodon Leather, Electrum Ingot, Square of Cilice, Angelstone
			end
		elseif (inventorySize == 70) then
			if (trade:hasItemQty(2538,1) and trade:hasItemQty(0747,1) and trade:hasItemQty(2704,1) and trade:hasItemQty(2743,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Peiste Leather, Orichalcum Ingot, Oil-Soaked Cloth, Oxblood Orb
			end
		elseif (inventorySize == 75) then
			if (trade:hasItemQty(1459,1) and trade:hasItemQty(1711,1) and trade:hasItemQty(2705,1) and trade:hasItemQty(2744,1)) then
				player:startEvent(0x0049, inventorySize+1); -- Griffon Leather, Molybdenum Ingot, Foulard, Angelskin Orb
			end
		end
	end
end; 

----------------------------------
-- Current Gob Quest
-----------------------------------
function gobquest(player,gobbiebag)
	currentQuest = 0;
	switch (gobbiebag) : caseof {
		[1] = function (x) currentQuest = 27; end, --Gobbiebag I
		[2] = function (x) currentQuest = 28; end, --Gobbiebag II
		[3] = function (x) currentQuest = 29; end, --Gobbiebag III
		[4] = function (x) currentQuest = 30; end, --Gobbiebag IV
		[5] = function (x) currentQuest = 74; end, --Gobbiebag V
		[6] = function (x) currentQuest = 75; end, --Gobbiebag VI
		[7] = function (x) currentQuest = 93; end, --Gobbiebag VII
		[8] = function (x) currentQuest = 94; end, --Gobbiebag VIII
		[9] = function (x) currentQuest = 123; end, --Gobbiebag IX
		[10] = function (x) currentQuest = 124; end, --Gobbiebag X
	default = function (x) end, }
	return currentQuest;
end;

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	TheGobbieBagX = player:getQuestStatus(JEUNO, THE_GOBBIEBAG_PART_X);
	pFame = player:getFameLevel(5);
	inventorySize = player:getContainerSize(0);
	gobbieBag = (inventorySize/5) - 5;
	TheGobbieBag = player:getQuestStatus(JEUNO,(gobquest(player,gobbieBag)));
	offer = 0
	offerLevel = 2 + gobbieBag;
	
	if (offerLevel > 9) then offerLevel = 9; end
	if (pFame >= offerLevel) then offer = 1; end
			
	if (TheGobbieBagX ~= 2) then			
		player:startEvent(0x002b,inventorySize+1,TheGobbieBag,offer);
	else
		player:startEvent(0x002b);
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
	
	gobbieBag = (player:getContainerSize(0)/5) - 5;
	currentQuest = gobquest(player,gobbieBag);
	
	if (csid == 0x002b and option == 0) then
		if (player:getQuestStatus(JEUNO,currentQuest) == 0) then 
			player:addQuest(JEUNO,currentQuest);
		end
	elseif (csid == 0x0049) then
		player:completeQuest(JEUNO,currentQuest);
		player:addFame(SAN_D_ORIA,20*SAN_FAME); --Arbitrary amounts
		player:addFame(BASTOK,20*BAS_FAME);
		player:addFame(WINDURST,20*WIN_FAME);
		player:increaseContainerSize(0,5);
		player:increaseContainerSize(5,5);
		player:tradeComplete();
	
		if (gobbieBag == 5) then
			player:setTitle(GREEDALOX);
		elseif (gobbieBag == 10) then
			player:setTitle(GRAND_GREEDALOX);
		end
	end
end;