-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Telepoint
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(PASHHOW_GATE_CRYSTAL) == false) then
        player:addKeyItem(PASHHOW_GATE_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,PASHHOW_GATE_CRYSTAL);
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