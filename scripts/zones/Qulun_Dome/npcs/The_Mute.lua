-----------------------------------
-- Area: Qulun Dome
--  NPC: The Mute
-- @zone 148
-- !pos <many>
-----------------------------------
package.loaded["scripts/zones/Beadeaux/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Beadeaux/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local duration = math.random(600,900);

    if (player:hasStatusEffect(dsp.effects.SILENCE) == false) then
        player:addStatusEffect(dsp.effects.SILENCE,0,0,duration);
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