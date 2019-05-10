-----------------------------------
-- Area: Bastok Markets
-- NPC: Michea
-- Quest NPC
-- Starts: Father Figure (100%) | The Elvaan Goldsmith (100%)
-- Involed in: Distant Loyalties
-- !pos -298 -16 -157 235
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
    local theElvaanGoldsmith = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_ELVAAN_GOLDSMITH);
    local distantLoyalties = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.DISTANT_LOYALTIES);
    local fatherFigure = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.FATHER_FIGURE);

    -- THE ELVAAN GOLDSMITH
    if (theElvaanGoldsmith >= QUEST_ACCEPTED and npcUtil.tradeHas(trade, 648)) then
        player:startEvent(216);

    -- DISTANT LOYALTIES
    elseif (distantLoyalties == QUEST_ACCEPTED and player:getVar("DistantLoyaltiesProgress") == 2 and npcUtil.tradeHas(trade, 653)) then
        player:startEvent(317);
        
    -- FATHER FIGURE
    elseif (fatherFigure == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 744)) then
        player:startEvent(241);
    end;
end;

function onTrigger(player,npc)
    local theElvaanGoldsmith = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_ELVAAN_GOLDSMITH);
    local distantLoyalties = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.DISTANT_LOYALTIES);
    local distantLoyaltiesProgress = player:getVar("DistantLoyaltiesProgress");
    local fatherFigure = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.FATHER_FIGURE);
    
    -- THE ELVAAN GOLDSMITH
    if (theElvaanGoldsmith == QUEST_AVAILABLE) then
        player:startEvent(215);
        
    -- DISTANT LOYALTIES
    elseif (distantLoyalties == QUEST_ACCEPTED and distantLoyaltiesProgress >= 1 and distantLoyaltiesProgress <= 3) then
        if (distantLoyaltiesProgress == 1 and player:hasKeyItem(dsp.ki.GOLDSMITHING_ORDER)) then
            player:startEvent(315);
        elseif (distantLoyaltiesProgress == 2) then
            player:startEvent(316);
        elseif (distantLoyaltiesProgress == 3 and player:needToZone() == true) then
            player:startEvent(317);
        elseif (distantLoyaltiesProgress == 3 and player:needToZone() == false) then
            player:startEvent(318);
        end;
        
    -- FATHER FIGURE
    elseif (theElvaanGoldsmith == QUEST_COMPLETED and fatherFigure == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 2) then
        player:startEvent(240);

    -- DEFAULT DIALOG
    else
        player:startEvent(125);
    end;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- THE ELVAAN GOLDSMITH
    if (csid == 215) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.THE_ELVAAN_GOLDSMITH);
    elseif (csid == 216) then
        local fame = player:hasCompletedQuest(BASTOK, dsp.quest.id.bastok.THE_ELVAAN_GOLDSMITH) and 8 or 100;
        if (npcUtil.completeQuest(player, BASTOK, dsp.quest.id.bastok.THE_ELVAAN_GOLDSMITH, {gil=180, fame=fame})) then
            player:confirmTrade();
        end

    -- DISTANT LOYALTIES
    elseif (csid == 315) then
        player:delKeyItem(dsp.ki.GOLDSMITHING_ORDER);
        player:setVar("DistantLoyaltiesProgress",2);
    elseif (csid == 317) then
        player:confirmTrade();
        player:setVar("DistantLoyaltiesProgress",3);
        player:needToZone(true);
    elseif (csid == 318) then
        player:setVar("DistantLoyaltiesProgress",4);
        npcUtil.giveKeyItem(player, dsp.ki.MYTHRIL_HEARTS);
        
    -- FATHER FIGURE
    elseif (csid == 240) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.FATHER_FIGURE);
    elseif (csid == 241) then
        if (npcUtil.completeQuest(player, BASTOK, dsp.quest.id.bastok.FATHER_FIGURE, {gil=2200, fame=120})) then
            player:confirmTrade();
        end
    end
end;
