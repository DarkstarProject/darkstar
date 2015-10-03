-----------------------------------
--  Area: Celennia_Memorial_Library
--  NPC:  Andreine
--  Type: Mythic Weapon Vendor

-----------------------------------
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Celennia_Memorial_Library/TextIDs");
require("scripts/globals/magiantrials");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();

itemQuality = 0;
 if(trade:hasItemQty(3443,1,18492,1) and count == 2) then -- conqueror
        player:tradeComplete();
        player:addItem(18991);
		
    elseif(trade:hasItemQty(3443,1,18753,1) and count == 2) then -- glanzfaust
        player:tradeComplete();
        player:addItem(18992);
	
	elseif(trade:hasItemQty(3443,1,18851,1) and count == 2) then -- yagrush
        player:tradeComplete();
        player:addItem(18993);
		
	elseif(trade:hasItemQty(3443,1,18589,1) and count == 2) then -- laevatein
        player:tradeComplete();
        player:addItem(18994);
		
	elseif(trade:hasItemQty(3443,1,17742,1) and count == 2) then -- murgleis
        player:tradeComplete();
        player:addItem(18995);
		
	elseif(trade:hasItemQty(3443,1,18003,1) and count == 2) then -- Vajra
        player:tradeComplete();
        player:addItem(18996);
		
	elseif(trade:hasItemQty(3443,1,17744,1) and count == 2) then -- burtgang
        player:tradeComplete();
        player:addItem(18997);
		
	elseif(trade:hasItemQty(3443,1,18944,1) and count == 2) then -- liberator
        player:tradeComplete();
        player:addItem(18998);
	
	elseif(trade:hasItemQty(3443,1,17956,1) and count == 2) then -- aymur
        player:tradeComplete();
        player:addItem(18999);
		
	elseif(trade:hasItemQty(3443,1,18034,1) and count == 2) then -- carnwenhan
        player:tradeComplete();
        player:addItem(19000);
		
	elseif(trade:hasItemQty(3443,1,18719,1) and count == 2) then --  gastraphetes
        player:tradeComplete();
        player:addItem(19001);
		
	elseif(trade:hasItemQty(3443,1,18443,1) and count == 2) then -- Kogarasumaru 
        player:tradeComplete();
        player:addItem(19002);
		
	elseif(trade:hasItemQty(3443,1,18426,1) and count == 2) then -- Nagi 
        player:tradeComplete();
        player:addItem(19003);
		
	elseif(trade:hasItemQty(3443,1,18120,1) and count == 2) then -- Ryunohige
        player:tradeComplete();
        player:addItem(19004);
		
	elseif(trade:hasItemQty(3443,1,18590,1) and count == 2) then -- Nirvana 
        player:tradeComplete();
        player:addItem(19005);
		
	elseif(trade:hasItemQty(3443,1,17743,1) and count == 2) then -- Tizona
        player:tradeComplete();
        player:addItem(19006);
		
	elseif(trade:hasItemQty(3443,1,18720,1) and count == 2) then -- Death Penalty
        player:tradeComplete();
        player:addItem(19007);
	
	elseif(trade:hasItemQty(3443,1,18754,1) and count == 2) then -- Kenkonken
        player:tradeComplete();
        player:addItem(19008);
		
	elseif(trade:hasItemQty(3443,1,19102,1) and count == 2) then -- Terpsichore
        player:tradeComplete();
        player:addItem(18989);
	
	elseif(trade:hasItemQty(3443,1,18592,1) and count == 2) then -- Tupsimati
        player:tradeComplete();
        player:addItem(18990);
		
    end
end

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local LearnerLog = player:hasKeyItem(MAGIAN_LEARNERS_LOG);
    local TrialLog = player:hasKeyItem(MAGIAN_TRIAL_LOG);
    if (player:getMainLvl() < 30) then
        player:startEvent(10151);
    elseif (player:getVar("MetGreenMagianMog") == 0 and LearnerLog == false) then
        if (TrialLog == false) then
            player:startEvent(10160, 0);
        else
            player:startEvent(10160, 1);
        end
    else
        player:startEvent(10152); -- parameters unknown
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    printf("CSID: %u",csid);
    printf("RESULT: %u",option);
    if (csid == 10160 and option == 1) then
        if (player:hasKeyItem(MAGIAN_TRIAL_LOG) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,MAGIAN_LEARNERS_LOG);
            player:addKeyItem(MAGIAN_LEARNERS_LOG);
        end
        player:setVar("MetGreenMagianMog",1);
    --elseif
        --
    end
end;