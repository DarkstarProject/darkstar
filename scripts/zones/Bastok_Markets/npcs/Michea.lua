-----------------------------------
-- Area: Bastok Markets
-- NPC: Michea
-- Quest NPC
-- Starts: Father Figure (100%) | The Elvaan Goldsmith (100%)
-- Involed in: Fetichism | Where Two Paths Converge
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
CopperIngot = trade:hasItemQty(648,1);
SilverIngot = trade:hasItemQty(744,1);
MythrilIngot = trade:hasItemQty(653,1);

    if ((CopperIngot == true) and count == 1) then
        TheElvaanGoldsmith = player:getQuestStatus(BASTOK,THE_ELVAAN_GOLDSMITH);
        if (TheElvaanGoldsmith == 1) then
            player:tradeComplete();
            player:addGil(GIL_RATE*180);
            player:completeQuest(BASTOK,THE_ELVAAN_GOLDSMITH);
            player:addFame(BASTOK,100);
            player:startEvent(0x00d8);
        end
    elseif ((SilverIngot == true) and count == 1) then
        FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
        if (FatherFigure == 1) then
            player:tradeComplete();
            player:addGil(GIL_RATE*2200);
            player:completeQuest(BASTOK,FATHER_FIGURE);
            player:addFame(BASTOK,120);
            player:startEvent(0x00f1);
        end;
    elseif ((MythrilIngot == true) and count == 1) then
        DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);
        DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");
        if (DistantLoyalties == 1 and DistantLoyaltiesProgress == 2)        then
            player:tradeComplete();
            player:startEvent(0x013d);
        end;
    end;
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

pFame = player:getFameLevel(BASTOK);
FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
TheElvaanGoldsmith = player:getQuestStatus(BASTOK,THE_ELVAAN_GOLDSMITH);
DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);
DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");

    if (TheElvaanGoldsmith == 0) then
        player:startEvent(0x00d7);
    elseif (DistantLoyalties ~= 1) then
            if (FatherFigure == 0 and TheElvaanGoldsmith == 2 and pFame >= 2) then
                player:startEvent(0x00f0);
            else
                player:startEvent(0x007d);
            end;
    else
        if (DistantLoyaltiesProgress == 1 and player:hasKeyItem(GOLDSMITHING_ORDER)) then
            player:startEvent(0x013b);
        elseif (DistantLoyaltiesProgress == 2) then
            player:startEvent(0x013c);
        elseif (DistantLoyaltiesProgress == 3 and player:needToZone() == true) then
            player:startEvent(0x013d);
        elseif (DistantLoyaltiesProgress == 3 and player:needToZone() == false) then
            player:startEvent(0x013e);
        end;
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
    
    if (csid == 0x00d7) then
        player:addQuest(BASTOK,THE_ELVAAN_GOLDSMITH);
    elseif (csid == 0x00f0) then
        player:addQuest(BASTOK,FATHER_FIGURE);
    elseif (csid == 0x00d8) then
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*180);
    elseif (csid == 0x00f1) then
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2200);
    elseif (csid == 0x013b) then
        player:delKeyItem(GOLDSMITHING_ORDER);
        player:setVar("DistantLoyaltiesProgress",2);
    elseif (csid == 0x013d) then
        player:setVar("DistantLoyaltiesProgress",3);
        player:needToZone(true);
    elseif (csid == 0x013e) then
        player:setVar("DistantLoyaltiesProgress",4);
        player:addKeyItem(MYTHRIL_HEARTS);
        player:messageSpecial(KEYITEM_OBTAINED,MYTHRIL_HEARTS);
    end
    
end;