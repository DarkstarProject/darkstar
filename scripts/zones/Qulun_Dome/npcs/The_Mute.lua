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

    if (player:hasStatusEffect(dsp.effect.SILENCE) == false) then
        player:addStatusEffect(dsp.effect.SILENCE,0,0,duration);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;