-----------------------------------
-- Area: Lower Jeuno
-- NPC: Vhana Ehgaklywha
-- Lights lamps in Lower Jeuno if nobody accepts Community Service by 1AM.
-- @pos -122.853 0.000 -195.605
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/pathfind");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/Lower_Jeuno/NPCIDs");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- speaking to pathing NPCs stops their progress, and they never resume
    -- so let's comment this out
    
    -- player:showText(npc, 7160);
end;

-----------------------------------
-- onPath
-----------------------------------

function onPath(npc)
    if npc:isFollowingPath() then
    
        -- if vasha reaches the end node, halt and disappear her.
        -- do this at node 48 instead of 49 because isFollowingPath will be false by 49.
        -- if we remove the isFollowingPath check, this code runs every second forever.
        -- once a pathThrough begins, there doesn't seem to be a clean way to stop onPath
        -- from being called forever.

        if (npc:atPoint(pathfind.get(lampPath,48))) then
            npc:clearPath();
            npc:setStatus(2);

        -- if vasha is at one of the lamp points, turn on that lamp.
        -- she reaches the lamps in reverse order of their npcIds, hence (12 - i).

        else
            for i, v in ipairs(lampPoints) do
                local lampPos = pathfind.get(lampPath,v);
                if npc:atPoint(lampPos) then
                    -- Vhana is at a lamp (she reaches them in reverse order)
                    local lampId = lampIdOffset + (12 - i);
                    GetNPCByID(lampId):setAnimation(ANIMATION_OPEN_DOOR);
                    break;
                end
            end

        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
end;