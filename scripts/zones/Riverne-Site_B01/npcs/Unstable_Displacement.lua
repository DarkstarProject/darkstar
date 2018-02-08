-----------------------------------
-- Area: Riverne Site #B01
-- NPC:  Unstable Displacement
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Riverne-Site_B01/TextIDs");
require("scripts/zones/Riverne-Site_B01/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/status");
require("scripts/globals/bcnm");

function onTrade(player,npc,trade)
    local offset = npc:getID() - RIV_B_DISPLACEMENT_OFFSET;
    if (offset == 5 and TradeBCNM(player,player:getZoneID(),trade,npc)) then -- The Wyrmking Descends
        return;
    elseif (offset ~= 5 and trade:hasItemQty(1691,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        npc:openDoor(RIVERNE_PORTERS);
        player:messageSpecial(SD_HAS_GROWN);
    end
end;

function onTrigger(player,npc)
    local offset = npc:getID() - RIV_B_DISPLACEMENT_OFFSET;

    -- STORMS OF FATE
    if (offset == 5 and player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 1) then
        player:startEvent(1);
    elseif (offset == 5 and EventTriggerBCNM(player,npc)) then
        return 1;
    elseif (offset == 5) then
        player:messageSpecial(SPACE_SEEMS_DISTORTED);

    -- GIANT SCALE DISPLACEMENTS
    else
        if (npc:getAnimation() == ANIMATION_OPEN_DOOR) then
            if (offset == 20) then
                player:startEvent(7);
            elseif (offset == 34) then
                player:startEvent(22);
            elseif (offset == 38) then
                player:startEvent(38);
            end
        else
            player:messageSpecial(SD_VERY_SMALL);
        end
    end
end;

function onEventUpdate(player,csid,option)
    if (csid == 1 and EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

function onEventFinish(player,csid,option)
    if (csid == 1) then
        player:setVar('StormsOfFate',2);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;