-----------------------------------
-- Area: Port San d'Oria
--  NPC: Eaugouint
-- Standard Info NPC
-- !pos 28.555 -4.000 -74.860 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)
    if player:getVar("thePickpocket") == 1 then
        player:showText(npc, ID.text.PICKPOCKET_EAUGOUINT)
    else
        player:startEvent(579);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
