-----------------------------------
-- Area: Bastok Markets
--  NPC: Michea
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
            player:startEvent(216);
        end
    elseif ((SilverIngot == true) and count == 1) then
        FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
        if (FatherFigure == 1) then
            player:tradeComplete();
            player:addGil(GIL_RATE*2200);
            player:completeQuest(BASTOK,FATHER_FIGURE);
            player:addFame(BASTOK,120);
            player:startEvent(241);
        end;
    elseif ((MythrilIngot == true) and count == 1) then
        DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);
        DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");
        if (DistantLoyalties == 1 and DistantLoyaltiesProgress == 2)        then
            player:tradeComplete();
            player:startEvent(317);
        end;
    end;

end;

function onTrigger(player,npc)

pFame = player:getFameLevel(BASTOK);
FatherFigure = player:getQuestStatus(BASTOK,FATHER_FIGURE);
TheElvaanGoldsmith = player:getQuestStatus(BASTOK,THE_ELVAAN_GOLDSMITH);
DistantLoyalties = player:getQuestStatus(SANDORIA,DISTANT_LOYALTIES);
DistantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");

    if (TheElvaanGoldsmith == 0) then
        player:startEvent(215);
    elseif (DistantLoyalties ~= 1) then
            if (FatherFigure == 0 and TheElvaanGoldsmith == 2 and pFame >= 2) then
                player:startEvent(240);
            else
                player:startEvent(125);
            end;
    else
        if (DistantLoyaltiesProgress == 1 and player:hasKeyItem(GOLDSMITHING_ORDER)) then
            player:startEvent(315);
        elseif (DistantLoyaltiesProgress == 2) then
            player:startEvent(316);
        elseif (DistantLoyaltiesProgress == 3 and player:needToZone() == true) then
            player:startEvent(317);
        elseif (DistantLoyaltiesProgress == 3 and player:needToZone() == false) then
            player:startEvent(318);
        end;
    end;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 215) then
        player:addQuest(BASTOK,THE_ELVAAN_GOLDSMITH);
    elseif (csid == 240) then
        player:addQuest(BASTOK,FATHER_FIGURE);
    elseif (csid == 216) then
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*180);
    elseif (csid == 241) then
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2200);
    elseif (csid == 315) then
        player:delKeyItem(GOLDSMITHING_ORDER);
        player:setVar("DistantLoyaltiesProgress",2);
    elseif (csid == 317) then
        player:setVar("DistantLoyaltiesProgress",3);
        player:needToZone(true);
    elseif (csid == 318) then
        player:setVar("DistantLoyaltiesProgress",4);
        player:addKeyItem(MYTHRIL_HEARTS);
        player:messageSpecial(KEYITEM_OBTAINED,MYTHRIL_HEARTS);
    end

end;