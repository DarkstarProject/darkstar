-----------------------------------
-- Area: Norg
--  NPC: Jaucribaix
-- Starts and Finishes Quest: Forge Your Destiny, The Sacred Katana, Yomi Okuri, A Thief in Norg!?
-- !pos 91 -7 -8 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Norg/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(OUTLANDS, FORGE_YOUR_DESTINY) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, {1152, 1153})) then -- Bomb Steel, Sacred Branch
        player:startEvent(27);
    elseif (player:getQuestStatus(OUTLANDS, THE_SACRED_KATANA) == QUEST_ACCEPTED and player:hasKeyItem(HANDFUL_OF_CRYSTAL_SCALES) and npcUtil.tradeHas(trade, 17809)) then -- Mumeito
        player:startEvent(141);
    elseif (player:getQuestStatus(OUTLANDS, A_THIEF_IN_NORG) == QUEST_ACCEPTED and player:hasKeyItem(CHARRED_HELM) and npcUtil.tradeHas(trade, 823)) then -- Gold Thread
        player:startEvent(162);
    end
end;

function onTrigger(player,npc)
    local forgeYourDestiny  = player:getQuestStatus(OUTLANDS, FORGE_YOUR_DESTINY);
    local theSacredKatana   = player:getQuestStatus(OUTLANDS, THE_SACRED_KATANA);
    local yomiOkuri         = player:getQuestStatus(OUTLANDS, YOMI_OKURI);
    local aThiefinNorg      = player:getQuestStatus(OUTLANDS, A_THIEF_IN_NORG);
    local swordTimer        = player:getVar("ForgeYourDestiny_timer");
    local swordTimeLeft     = swordTimer - os.time();
    local yomiOkuriCS       = player:getVar("yomiOkuriCS");
    local aThiefinNorgCS    = player:getVar("aThiefinNorgCS");
    local mLvl              = player:getMainLvl();
    local mJob              = player:getMainJob();

    -- FORGE YOUR DESTINY
    if (forgeYourDestiny == QUEST_AVAILABLE and mLvl >= ADVANCED_JOB_LEVEL) then
        player:startEvent(25, 1153, 1152); -- start quest
    elseif (forgeYourDestiny == QUEST_ACCEPTED) then
        if (swordTimer == 0) then
            player:startEvent(26); -- remind objective
        elseif (swordTimeLeft > 0) then
            player:startEvent(28, swordTimeLeft / 144); -- wait longer
        else
            player:startEvent(29, 17809); -- finish quest
        end
        
    -- THE SACRED KATANA
    elseif (forgeYourDestiny == QUEST_COMPLETED and theSacredKatana == QUEST_AVAILABLE and mJob == JOBS.SAM and mLvl >= AF1_QUEST_LEVEL) then
        player:startEvent(139); -- start quest
    elseif (theSacredKatana == QUEST_ACCEPTED) then
        player:startEvent(player:hasItem(17809) and 140 or 143); -- event with or without Mumeito
        
    -- YOMI OKURI
    elseif (theSacredKatana == QUEST_COMPLETED and yomiOkuri == QUEST_AVAILABLE and mJob == JOBS.SAM and mLvl >= AF2_QUEST_LEVEL) then
        player:startEvent(player:needToZone() and 142 or 146); -- event with or without needing to zone
    elseif (yomiOkuri == QUEST_ACCEPTED) then
        if (yomiOkuriCS <= 3) then
            player:startEvent(player:hasKeyItem(YOMOTSU_FEATHER) and 152 or 147); -- accept feather or remind objective
        elseif (yomiOkuriCS == 4) then
            player:startEvent(player:needToZone() and 153 or 154); -- event with or without needing to zone
        elseif (player:hasKeyItem(YOMOTSU_HIRASAKA)) then
            player:startEvent(155);
        elseif (player:hasKeyItem(FADED_YOMOTSU_HIRASAKA)) then
            player:startEvent(156);
        end
        
    -- A THIEF IN NORG
    elseif (yomiOkuri == QUEST_COMPLETED and aThiefinNorg == QUEST_AVAILABLE and mJob == JOBS.SAM and mLvl >= AF3_QUEST_LEVEL) then
        player:startEvent(player:needToZone() and 157 or 158) -- even with or without needing to zone
    elseif (aThiefinNorg == QUEST_ACCEPTED) then
        if (aThiefinNorgCS < 5) then
            player:startEvent(159); -- remind objective
        elseif (aThiefinNorgCS == 5) then
            player:startEvent(166); -- give banishing charm
        elseif (aThiefinNorgCS == 6) then
            player:startEvent(player:hasItem(1166) and 167 or 168); -- remind objective or give new banishing charm
        elseif (aThiefinNorgCS == 7) then
            player:startEvent(160); -- bring gold thread
        elseif (aThiefinNorgCS == 8) then
            player:startEvent(161); -- remind objective
        elseif (aThiefinNorgCS == 9) then
            player:startEvent(player:needToZone() and 163 or 164); -- event with or without needing to zone
        end
    elseif (aThiefinNorg == QUEST_COMPLETED) then
        player:startEvent(165); -- new default dialog

    -- DEFAULT DIALOG
    else
        player:startEvent(71);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- FORGE YOUR DESTINY
    if (csid == 25 and option == 1) then
        player:addQuest(OUTLANDS, FORGE_YOUR_DESTINY);
    elseif (csid == 27) then
        player:confirmTrade();
        player:setVar("ForgeYourDestiny_timer", os.time() + 10368); -- 3 game days
    elseif (csid == 29 and npcUtil.completeQuest(player, OUTLANDS, FORGE_YOUR_DESTINY, {item=17809, fame=30, fameArea=NORG, title=BUSHIDO_BLADE, var={"ForgeYourDestiny_timer", "ForgeYourDestiny_Event"}})) then -- Mumeito
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_SAMURAI, 17809);
        player:unlockJob(JOBS.SAM);

    -- THE SACRED KATANA
    elseif (csid == 139 and option == 1) then
        player:addQuest(OUTLANDS, THE_SACRED_KATANA);
    elseif (csid == 141 and npcUtil.completeQuest(player, OUTLANDS, THE_SACRED_KATANA, {item=17812, fame=AF1_FAME, fameArea=NORG})) then -- Magoroku
        player:confirmTrade();
        player:delKeyItem(HANDFUL_OF_CRYSTAL_SCALES);
        player:needToZone(true);
        
    -- YOMI OKURI
    elseif (csid == 146 and option == 1) then
        player:addQuest(OUTLANDS,YOMI_OKURI);
        player:setVar("yomiOkuriCS",1);
    elseif (csid == 152) then
        player:delKeyItem(YOMOTSU_FEATHER);
        player:setVar("yomiOkuriCS",4);
        player:needToZone(true);
    elseif (csid == 154) then
        player:setVar("yomiOkuriCS",5);
        npcUtil.giveKeyItem(player, YOMOTSU_HIRASAKA);
    elseif (csid == 156 and npcUtil.completeQuest(player, OUTLANDS, YOMI_OKURI, {item=14100, fame=AF2_FAME, fameArea=NORG, var="yomiOkuriCS"})) then -- Myochin Sune-Ate
        player:delKeyItem(FADED_YOMOTSU_HIRASAKA);
        player:needToZone(true);
        
    -- A THIEF IN NORG
    elseif (csid == 158 and option == 1) then
        player:addQuest(OUTLANDS,A_THIEF_IN_NORG);
        player:setVar("aThiefinNorgCS",1);
    elseif ((csid == 166 or csid == 168) and npcUtil.giveItem(player, 1166)) then -- Banishing Charm
        player:setVar("aThiefinNorgCS",6);
    elseif (csid == 160) then
        player:setVar("aThiefinNorgCS",8);
    elseif (csid == 162) then
        player:confirmTrade();
        player:delKeyItem(CHARRED_HELM);
        player:setVar("aThiefinNorgCS",9);
        player:needToZone(true);
    elseif (csid == 164) then
        npcUtil.completeQuest(player, OUTLANDS, A_THIEF_IN_NORG, {item=13868, title=PARAGON_OF_SAMURAI_EXCELLENCE, fame=AF3_FAME, fameArea=NORG, var={"aThiefinNorgCS"}});
    end
end;
