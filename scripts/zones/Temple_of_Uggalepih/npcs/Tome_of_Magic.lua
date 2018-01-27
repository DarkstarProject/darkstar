-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: Tome of Magic
-- Involved In Windurst Mission 7-2 (Optional Dialogue)
-- !pos 346 0 343 159 <many>
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

    local cs = math.random(0x014,0x016)
    player:startEvent(cs);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

end;