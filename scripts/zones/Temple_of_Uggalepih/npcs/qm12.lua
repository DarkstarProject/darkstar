-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (San dOria Mission 8-2)
-- @pos -32 -17 -153
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(SANDORIA) == LIGHTBRINGER and player:getVar("MissionStatus") == 3) then
        player:setVar("MissionStatus",4);
        player:addKeyItem(PIECE_OF_A_BROKEN_KEY2);
        player:messageSpecial(KEYITEM_OBTAINED,PIECE_OF_A_BROKEN_KEY2);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;