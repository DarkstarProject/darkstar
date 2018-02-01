-----------------------------------
--  Area: West Ronfaure
--  NPC:  Signpost
--  @zone 100
-----------------------------------
require("scripts/zones/West_Sarutabaruta/MobIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = npc:getID() - W_RONFAURE_SIGNPOST_OFFSET;
    if (offset == 4) then
        player:startEvent(115);
    elseif (offset >=0 and offset <= 3) then
        player:startEvent(107 + offset);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
