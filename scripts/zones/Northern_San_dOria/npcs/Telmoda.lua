-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Telmoda
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Northern_San_dOria/IDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)
    Telmoda_Madaline = player:getVar("Telmoda_Madaline_Event");

    if (Telmoda_Madaline ~= 1) then
        player:setVar(player,"Telmoda_Madaline_Event",1);
        player:startEvent(531);
    else
        player:startEvent(616);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
