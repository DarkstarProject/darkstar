-----------------------------------
-- Area: Upper Jeuno
--  NPC: Deadly Minnow
-- Standard Merchant NPC
-- Involved in Quest: Borghertz's Hands (1st quest only)
-- @zone 244
-- !pos -5 1 48
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getVar("BorghertzHandsFirstTime") == 1) then
        player:startEvent(24);
        player:setVar("BorghertzHandsFirstTime",2);
    else
        player:showText(npc,DEADLYMINNOW_SHOP_DIALOG);

        local stock =
        {12442,13179,    --Studded Bandana
                 12425,22800,    --Silver Mask
                 12426,47025,    --Banded Helm
                 12570,20976,    --Studded Vest
                 12553,35200,    --Silver Mail
                 12554,66792,    --Banded Mail
                 12698,11012,    --Studded Gloves
                 12681,18800,    --Silver Mittens
                 12672,23846,    --Gauntlets
                 12682,35673}    --Mufflers


        dsp.shop.general(player, stock);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

