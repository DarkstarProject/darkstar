-----------------------------------
-- Area: Bastok Markets
-- NPC:  Brygid
-- Start & Finishes Quest: Brygid the Stylist & Brygid the Stylist Returns
-- Involved in Quests: Riding on the Clouds
-- @zone 235
-- @pos -90 -4 -108
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/equipment");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

body_list = {12554,13712,12594,13723,12603,13699,12610,13783,12572,12611,13796,12571,13750,12604,13752,12544,13730,12578,12553,12595}
legs_list = {12829,12800,12866,12809,12810,12850,12828,12859,12837,14243,12838,12867,12827,12836,12860,12851}

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local BrygidReturns = player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST_RETURNS);
    local wantsSubligar = player:getVar("BrygidWantsSubligar");
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 3) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    elseif (BrygidReturns == QUEST_ACCEPTED and wantsSubligar ~= 0) then
        if (wantsSubligar==13) then
            if (trade:getItemCount() == 1 and trade:hasItemQty(15375+wantsSubligar,1)) then 
            player:tradeComplete();
            player:startEvent(383);
            end
        else
            if (trade:getItemCount() == 1 and trade:hasItemQty(15374+wantsSubligar,1)) then 
            player:tradeComplete();
            player:startEvent(383);
            end
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local BrygidTheStylist = player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST);
    local BrygidReturns = player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST_RETURNS);
    local head = player:getEquipID(SLOT_HEAD);
    local body = player:getEquipID(SLOT_BODY);
    local hands = player:getEquipID(SLOT_HANDS);
    local legs = player:getEquipID(SLOT_LEGS);
    local feet = player:getEquipID(SLOT_FEET);
    
    local getBody = player:getVar("BrygidGetBody");
    local getLegs = player:getVar("BrygidGetLegs");
    local wantsSubligar = player:getVar("BrygidWantsSubligar");
    
    local BrygidSet = 0;
    if (body == 12600 and legs == 12832) then BrygidSet = 1 end;

    if (BrygidTheStylist == QUEST_ACCEPTED and BrygidSet == 1) then
        player:startEvent(0x0137);
    elseif ((BrygidReturns ~= QUEST_ACCEPTED and BrygidTheStylist == QUEST_COMPLETED) and
           (isArtifactArmor(head) or isArtifactArmor(body) or isArtifactArmor(hands) 
            or isArtifactArmor(legs) or isArtifactArmor(feet))) then
            -- Randomize and store sets here
            repeat
                getBody = body_list[math.random(1,20)];
            until(player:canEquipItem(getBody,false))
            repeat
                getLegs = legs_list[math.random(1,16)];
            until(player:canEquipItem(getLegs,false))
            player:setVar("BrygidGetBody",getBody);
            player:setVar("BrygidGetLegs",getLegs);
            --printf("Body %u Legs %u\n",getBody,getLegs);
            player:startEvent(380,BrygidSet,getBody,getLegs,player:getMainJob());
    elseif (BrygidReturns == QUEST_ACCEPTED and body == getBody and legs == getLegs and wantsSubligar == 0) then
        -- Have the right equips, proceed with quest
        player:startEvent(382);
    elseif (BrygidReturns == QUEST_ACCEPTED and wantsSubligar == 0) then
        -- Remind player what they need to wear
        player:startEvent(381,BrygidSet,getBody,getLegs,player:getMainJob());
    elseif (BrygidReturns == QUEST_ACCEPTED and wantsSubligar ~= 0) then
        -- Remind player what subligar they need to turn in and the reward
        if (wantsSubligar==13) then
        player:startEvent(385,0,14400+wantsSubligar,15375+wantsSubligar);
        else
        player:startEvent(385,0,14400+wantsSubligar,15374+wantsSubligar);
        end
    elseif (BrygidTheStylist ~= QUEST_COMPLETED) then
        player:startEvent(0x0136);
    else
        player:startEvent(0x0077);
    end
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 382) then
        local canEquip = 0; 
        local hasBody = 0;
        if (player:canEquipItem(14400+option,true)) then    canEquip = 1; end
        if not(player:hasItem(14400+option)) then hasBody = 1; end
        player:updateEvent(0,option-1,hasBody,canEquip);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local wantsSubligar = player:getVar("BrygidWantsSubligar");
    
    if (csid == 0x0136 and player:getQuestStatus(BASTOK,BRYGID_THE_STYLIST) == QUEST_AVAILABLE) then
        player:addQuest(BASTOK,BRYGID_THE_STYLIST);
    elseif (csid == 0x0137) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12720);
        else
            player:addTitle(BRYGIDAPPROVED);
            player:addItem(12720);
            player:messageSpecial(ITEM_OBTAINED,12720);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,BRYGID_THE_STYLIST);
        end
    elseif (csid == 380) then
        player:delQuest(BASTOK,BRYGID_THE_STYLIST_RETURNS);
        player:addQuest(BASTOK,BRYGID_THE_STYLIST_RETURNS);
    elseif (csid == 382 and option ~= 99) then
        player:setVar("BrygidWantsSubligar",option);
    elseif (csid == 383) then
        player:setVar("BrygidGetBody",0);
        player:setVar("BrygidGetLegs",0);
        player:setVar("BrygidWantsSubligar",0);
        player:addTitle(BASTOKS_SECOND_BEST_DRESSED);
        player:addItem(14400+wantsSubligar);
        player:messageSpecial(ITEM_OBTAINED,14400+wantsSubligar);
        player:addFame(BASTOK,30);
        player:completeQuest(BASTOK,BRYGID_THE_STYLIST_RETURNS);
    end    
end;