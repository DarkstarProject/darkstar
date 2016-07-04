-----------------------------------
-- Area: Port San d'Oria
-- NPC:  Fontoumant
-- Starts Quest: The Brugaire Consortium
-- Involved in Quests: Riding on the Clouds
-- @zone 232
-- @pos -10 -10 -122
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local count = trade:getItemCount();
    if (player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM) == QUEST_ACCEPTED) then
        if (count == 1 and trade:getGil() == 100) then  -- pay to replace package
            local prog = player:getVar("TheBrugaireConsortium-Parcels");
            if (prog == 10 and player:hasItem(593) == false) then
                player:startEvent(0x0260);
                player:setVar("TheBrugaireConsortium-Parcels",11)
            elseif (prog == 20 and player:hasItem(594) == false) then
                player:startEvent(0x0261);
                player:setVar("TheBrugaireConsortium-Parcels",21)
            elseif (prog == 30 and player:hasItem(595) == false) then
                player:startEvent(0x0262);
                player:setVar("TheBrugaireConsortium-Parcels",31)
            end
        end
    end
    
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and count == 1) then -- Trade Magicmart Flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_1") == 6) then
        if (trade:hasItemQty(1127,1) and count == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_1",0);
            player:tradeComplete();
            player:addKeyItem(SCOWLING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SCOWLING_STONE);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local TheBrugaireConsortium = player:getQuestStatus(SANDORIA,THE_BRUGAIRE_CONSORTIUM);

    if (TheBrugaireConsortium == QUEST_AVAILABLE) then
        player:startEvent(0x01fd);
    elseif (TheBrugaireConsortium == QUEST_ACCEPTED) then
    
        local prog = player:getVar("TheBrugaireConsortium-Parcels");
        if (prog == 11) then
            player:startEvent(0x01ff);
        elseif (prog == 21) then
            player:startEvent(0x0200);
        elseif (prog == 31) then
            player:startEvent(0x0203);
        else
            player:startEvent(0x0230);
        end
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
    local freeSlots = player:getFreeSlotsCount();
    if (csid == 0x01fd and option == 0) then
        if (freeSlots ~= 0) then
            player:addItem(593);
            player:messageSpecial(ITEM_OBTAINED,593);
            player:addQuest(SANDORIA,THE_BRUGAIRE_CONSORTIUM)
            player:setVar("TheBrugaireConsortium-Parcels",10)
        else
            player:startEvent(0x0219);
        end
    elseif (csid == 0x01ff) then
        if (freeSlots ~= 0) then
            player:addItem(594);
            player:messageSpecial(ITEM_OBTAINED,594);
            player:setVar("TheBrugaireConsortium-Parcels",20);
        else
            player:startEvent(0x0219);
        end
    elseif (csid == 0x0200) then
        if (freeSlots ~= 0) then
            player:addItem(595);
            player:messageSpecial(ITEM_OBTAINED,595);
            player:setVar("TheBrugaireConsortium-Parcels",30);
        else
            player:startEvent(0x0219);
        end
    elseif (csid == 0x0260 or csid == 0x0261 or csid == 0x0262) then
        player:tradeComplete()
    elseif (csid == 0x0203) then
        if (freeSlots ~= 0) then
            player:addItem(0x3001);
            player:messageSpecial(ITEM_OBTAINED,0x3001);
            player:addTitle(COURIER_EXTRAORDINAIRE);
            player:completeQuest(SANDORIA,THE_BRUGAIRE_CONSORTIUM);
            player:addFame(SANDORIA,30);
            player:setVar("TheBrugaireConsortium-Parcels",0);
        else
            player:startEvent(0x0219);
        end
    end

end;