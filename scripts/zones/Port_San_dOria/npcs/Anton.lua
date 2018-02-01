-----------------------------------
-- Area: Port San d'Oria
--  NPC: Anton
-- @zone 232
-- !pos -19 -8 27
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(AIRSHIP_PASS) == false) then
        player:startEvent(517);
    elseif (player:getGil() < 200) then
        player:startEvent(716);
    else
        player:startEvent(604);
    end
    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 604) then
        X = player:getXPos();

        if (X >= -13 and X <= -8) then
            player:delGil(200);
        end
    end

end;
