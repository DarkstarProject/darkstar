-----------------------------------
-- Area: Selbina
-- NPC: Valgeir
-- involved in his name is his name is Valgeir quest
-- involved in expertise quest
-- involved in the basics quest
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");

--player:startEvent(100);-- His name is Valgeir quest
--player:startEvent(101); -- I have nothing to say to you
--player:startEvent(102); -- Cook something for me quest Expertise
--player:startEvent(103); -- Found the ingredients quest Expertise
--player:startEvent(104);-- Still not found ingredients quest Expertise
--player:startEvent(105);-- Done cooking quest Expertise
--player:startEvent(106);-- Involved in back to basics quest
--player:startEvent(107); -- End back to basics quest (I think)
--player:startEvent(140);-- I am busy standar dialog

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

if (player:getQuestStatus(OTHER_AREAS,EXPERTISE)== QUEST_ACCEPTED) then
    count = trade:getItemCount();
    ScreamFungus  = trade:hasItemQty(4447,1);-- 4447 - scream_fungus 4400 - slice_of_land_crab_meat
    LandCrabMeat  = trade:hasItemQty(4400,1); 
    if (ScreamFungus   == true and LandCrabMeat  == true and count == 2) then 
        player:startEvent(103); -- Found the ingredients quest Expertise
    end;
end;
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

if (player:getQuestStatus(OTHER_AREAS,HIS_NAME_IS_VALGEIR)==QUEST_ACCEPTED and player:hasKeyItem(90)) then -- if quest accepted and has pizza
    player:startEvent(100);-- His name is Valgeir quest
elseif (player:getQuestStatus(OTHER_AREAS,EXPERTISE)==QUEST_ACCEPTED and player:getVar("QUEST_EXPERTISE_STATE_var")~=3) then
    if (player:getVar("QUEST_EXPERTISE_STATE_var")==1) then --already asked    
        player:startEvent(104);--still not found ingredients quest Expertise
    elseif (player:getVar("QUEST_EXPERTISE_STATE_var")==2) then --have to wait 24 hours
        Dayspassed=VanadielDayOfTheYear()-player:getVar("QuestExpertiseDayStarted_var");
        TotalHourLeft=24-(VanadielHour()+Dayspassed*24)+player:getVar("QuestExpertiseHourStarted_var");
        if (TotalHourLeft<0) then -- done waiting
            player:startEvent(105);-- done cooking quest Expertise
        else -- have to wait more
            player:startEvent(140);-- i am busy standar dialog
        end;
    else
        player:startEvent(102,4447,4400); -- cook something for me quest Expertise  4447 - scream_fungus 4400 - slice_of_land_crab_meat
    end;
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_ACCEPTED and player:hasKeyItem(MHAURAN_COUSCOUS)) then -- if quest accepted and has MHAURAN_COUSCOUS 
    if (player:getFreeSlotsCount() == 0) then                     
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4436); --4436 - baked_popoto
    else
        player:startEvent(106);-- involved in back to basics quest
    end;
elseif (player:getQuestStatus(OTHER_AREAS,THE_BASICS)==QUEST_COMPLETED and     player:getVar("QuestTheBacisCommentary_var")==1) then 
    player:startEvent(107); -- end commentary the basics quest 
else
    player:startEvent(140);-- i am busy standar dialog    
end;

end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
if (csid==100) then
    player:delKeyItem(ARAGONEU_PIZZA); -- Give pizza to Valgeir
elseif (csid==102) then
    player:setVar("QUEST_EXPERTISE_STATE_var",1); -- Already asked    
elseif (csid==103) then  -- Found the ingredients
    --wait 24 hours
    player:tradeComplete();
    player:setVar("QUEST_EXPERTISE_STATE_var",2); -- Already asked
    player:setVar("QuestExpertiseHourStarted_var",VanadielHour());
    player:setVar("QuestExpertiseDayStarted_var",VanadielDayOfTheYear());
elseif (csid==105) then  -- Done the cooking
    player:addKeyItem(LAND_CRAB_BISQUE); -- give LAND_CRAB_BISQUE
    player:messageSpecial(KEYITEM_OBTAINED,LAND_CRAB_BISQUE);
    player:setVar("QUEST_EXPERTISE_STATE_var",3); -- Done cooking
    player:setVar("QuestExpertiseHourStarted_var",0);
    player:setVar("QuestExpertiseDayStarted_var",0);
elseif (csid==106) then
    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4436);
    else
        player:setVar("QuestTheBacisCommentary_var",1);
        player:delKeyItem(MHAURAN_COUSCOUS); -- Give MHAURAN_COUSCOUS to Valgeir
        player:addItem(4436,1); -- baked popoto
        player:messageSpecial(ITEM_OBTAINED,4436); -- baked popoto
    end
elseif (csid==107) then
    player:setVar("QuestTheBacisCommentary_var",0);
end;
end;
