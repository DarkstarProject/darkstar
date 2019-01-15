-----------------------------------
-- Area: Port San d'Oria
--  NPC: Marquie
-- Standard Info NPC
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
        player:showText(npc, ID.text.PICKPOCKET_MARQUIE)
    else
        player:startEvent(565);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
