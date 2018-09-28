-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Rune of Release
-- !pos 412 -9 54 55
-----------------------------------
require("scripts/zones/Ilrusi_Atoll/globals");
require("scripts/zones/Ilrusi_Atoll/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (npc:getID() == ILRUSI_RUNE_OF_RELEASE) then
        player:startEvent(100,4);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 100 and option==1) then
        ILRUSI_ATOLL.respawnChests();
        ILRUSI_ATOLL.randomizeFigurehead();

        local points = 1000;
        if (player:hasCompletedMission(ASSAULT, GOLDEN_SALVAGE)) then
            if (player:hasKeyItem(dsp.ki.ASSAULT_ARMBAND)) then
                player:delKeyItem(dsp.ki.ASSAULT_ARMBAND);
                points = 1100;
            end
            player:addAssaultPoint(ILRUSI_ASSAULT_POINT, points);
            player:delMission(ASSAULT, GOLDEN_SALVAGE);
            player:delKeyItem(dsp.ki.ILRUSI_ASSAULT_ORDERS);
        end

        player:setPos(28,-7,620,138,54);
    end
end;
