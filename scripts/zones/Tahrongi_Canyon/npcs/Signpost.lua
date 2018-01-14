-----------------------------------
-- Area: Tahrongi Canyon
-- NPC:  Signpost
-----------------------------------
package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tahrongi_Canyon/TextIDs");
require("scripts/zones/Tahrongi_Canyon/MobIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local offset = math.floor((npc:getID() - TAHRONGI_SIGNPOST_OFFSET) / 2);
    player:messageSpecial(SIGN_1 + offset);
end; 

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
