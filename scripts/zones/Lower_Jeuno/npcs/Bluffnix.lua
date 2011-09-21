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
		tradeItem = gobItems(player,gobbieBag);
		
		if (trade:hasItemQty(tradeItem[1],1) and trade:hasItemQty(tradeItem[2],1) and trade:hasItemQty(tradeItem[3],1) and trade:hasItemQty(tradeItem[4],1)) then
			player:startEvent(0x0049, inventorySize+1);
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
-- Current Gob Quest Items
-----------------------------------
function gobItems(player,questItems)
	items = {};
	switch (questItems) : caseof {
		[1] = function (x) items = {0848,0652,0826,0788}; end, -- Dhalmel Leather, Steel Ingot, Linen Cloth, Peridot
		[2] = function (x) items = {0851,0653,0827,0789}; end, -- Ram Leather, Mythril Ingot, Wool Cloth, Turquoise
		[3] = function (x) items = {0855,0745,0828,0797}; end, -- Tiger Leather, Gold Ingot, Velvet Cloth, Painite
		[4] = function (x) items = {0931,0654,0829,0808}; end, -- Cermet Chunk, Darksteel Ingot, Silk Cloth, Goshenite
		[5] = function (x) items = {1637,1635,1636,1634}; end, -- Bugard Leather, Paktong Ingot, Moblinweave, Rhodonite
		[6] = function (x) items = {1741,1738,1739,1740}; end, -- HQ Eft Skin, Shakudo Ingot, Balloon Cloth, Iolite
		[7] = function (x) items = {2530,0655,0830,0812}; end, -- Lynx Leather, Adaman Ingot, Rainbow Cloth, Deathstone
		[8] = function (x) items = {2529,2536,2537,0813}; end, -- Smilodon Leather, Electrum Ingot, Square of Cilice, Angelstone
		[9] = function (x) items = {2538,0747,2704,2743}; end, -- Peiste Leather, Orichalcum Ingot, Oil-Soaked Cloth, Oxblood Orb
		[10] = function (x) items = {1459,1711,2705,2744}; end, -- Griffon Leather, Molybdenum Ingot, Foulard, Angelskin Orb
	default = function (x) end,	}
	return items;
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
	offer = 0;
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