-----------------------------------
-- Area: Dynamis Jeuno
--  NPC: ??? (Spawn when mega is defeated)
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(HYDRA_CORPS_TACTICAL_MAP) == false) then
        player:setVar("DynaJeuno_Win",1);
        player:addKeyItem(HYDRA_CORPS_TACTICAL_MAP);
        player:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_TACTICAL_MAP);
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