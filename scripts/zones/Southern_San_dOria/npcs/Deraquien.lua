-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Deraquien
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- Involved in Quest #2: A Timely Visit
-- !pos -98 -2 31 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local Fame = player:getFameLevel(SANDORIA);
    local Rank = player:getRank();
    local Nation = player:getNation();
    local Mission = player:getCurrentMission(Nation);
    
    local ATimelyVisit = player:getQuestStatus(SANDORIA,A_TIMELY_VISIT);
    local ATimelyVisitProgress = player:getVar("ATimelyVisitProgress");
    --printf("Fame %d, Rank %d, Nation %d, Mission %d, ATV %d, ATVP %d\n", Fame, Rank, Nation, Mission, ATimelyVisit, ATimelyVisitProgress);
    
    local WildcatSandy = player:getVar("WildcatSandy");

    -- Lure of the Wildcat: San d'Oria
    if (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,4) == false) then
        player:startEvent(0x032b);
        
    -- A Timely Visit
    elseif ((Nation == 0 and Rank >= 2                                      and Fame >= 3 and ATimelyVisit == 0) or
            (Nation ~= 0 and (Rank >= 3 or (Mission >=5 and Mission < 255)) and Fame >= 3 and ATimelyVisit == 0)) then
        if (ATimelyVisitProgress == 1) then
            player:startEvent(0x002f); -- shortened initial cs for the quest
        else
            player:startEvent(0x0021); -- initial cs for the quest - thief of royal scepter
        end;
    elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 2) then
        player:startEvent(0x0022); -- reminder to see Narvecaint - reminder of thief in la theine
    elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 3) then
        player:startEvent(0x0050); -- see Halver - thief caught but phillone was there
    elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 4) then
        player:startEvent(0x0014); -- reminder to see Halver - go get reward for thief
    elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 6) then
        player:startEvent(0x0057); -- vijrtall shows up and derq tells you go talk to phillone
    elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 7) then
        player:startEvent(0x001e); -- reminder to see Phillone
    elseif (ATimelyVisit == 1 and ATimelyVisitProgress == 8) then
        player:startEvent(0x0026); -- go to Jugner Forest to retrieve royal sceptre
    elseif (ATimelyVisit == 2) then
        -- TODO: confirm conditions for this one, not sure it goes here
        player:startEvent(0x028e); -- after quest completed - "nothing to report"
    
    -- default
    else
        -- TODO: confirm conditions for this one, not sure it goes here
        player:startEvent(0x012);
    end

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

    -- Lure of the Wildcat
    if (csid == 0x032b) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",4,true);
        
    -- A Timely Visit
    elseif (csid == 0x0021) then
        if (option == 1) then
            player:addQuest(SANDORIA, A_TIMELY_VISIT);
            player:getVar("ATimelyVisitProgress");
            player:setVar("ATimelyVisitProgress",2);
        else
            player:getVar("ATimelyVisitProgress");
            player:setVar("ATimelyVisitProgress",1);
        end;
    elseif (csid == 0x002f and option == 1) then
        player:addQuest(SANDORIA, A_TIMELY_VISIT);
        player:setVar("ATimelyVisitProgress",2);
    elseif (csid == 0x0050) then
        player:setVar("ATimelyVisitProgress",4);
    elseif (csid == 0x0057) then
        player:setVar("ATimelyVisitProgress",7);
    elseif (csid == 0x0026) then
        player:setVar("ATimelyVisitProgress",9);
        player:setPos(-206,-3,67);
    end

end;

-- TODO: find where this cs goes
--    player:startEvent(0x001b) -- the lady wasnt involved in the theft? I'll stick to my guard duties
