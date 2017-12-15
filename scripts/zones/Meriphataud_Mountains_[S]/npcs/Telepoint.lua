-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Telepoint
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(MERIPHATAUD_GATE_CRYSTAL) == false) then
        player:addKeyItem(MERIPHATAUD_GATE_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,MERIPHATAUD_GATE_CRYSTAL);
    else
        player:messageSpecial(ALREADY_OBTAINED_TELE);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;